Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6A668771B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:50:57 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id l127so188176410iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 06:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5V+WVu4kxDUYRDSpFvb7rRM7XiWUbwbd/E4GG2mMx9M=;
	b=0/7J5Wj/drj0SKS8bDGkIQkAPfKAx/3IyM20FHUyxAu1yFj2ssUM9zEogRwJIRZait
	9PPiJY26OiPcLgUdtXzCWBZgcjVxlbXOzIEdPutJzGrOrMa8pSEirNtnohtBUpL1HoIY
	Glegi8QlkVaaDy/rddgR5kErUlmrZ4RWMXUgL6pBMJprJxqnL4JIW7KniXaYAjC7ReFO
	uaL0j3IeX5f9ePJTTPptA/s1hlO0RJteJIIrO9MWNiEBNzMdhHMCRO6QRkWDVMyOiBgG
	BgCkAEG962WMu/FbUhkmaKn5FIJ0dDP97uIA6+jQkckZ5nLVSUDmJcizChS//14d0ZkB
	wSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5V+WVu4kxDUYRDSpFvb7rRM7XiWUbwbd/E4GG2mMx9M=;
	b=kobaTiqlL9q7qXrzNYAZ1hjuSGsaytcE9+xw1n1iPySmqNQ6OfwmwpDfpkZoZK0QW2
	ysXGXaZITuRNclh9ByXwW4v3GdpFTuNFss15XPq424o5mL9g1bmVpiX30QUU6uJ+6qqU
	IO3q0AdPhWz92rSf4CidnuNtvCI6XvkotFjMjIbdDzPdNuSZRFGC+rUxkHObZzglYmyw
	mnGvKaRjoEGrNcHE6vN3N73P/c12PaJMQPAOhU59mUi8ywyxNsE74fCAg3WTh4erLbJO
	9Rfapqns4vVxj35FOksQtOYGhF43KGWgEXukY2d+bN5yBlqBlP7lexxol/oYQUikUm61
	mBZg==
X-Gm-Message-State: AG10YOR2I4QQ2+rkDYdRU3qj+f/G3NvBrSm36DkGrozXy1mc309K3KYEXq+UPjOux9kFoa8VHLeKVxFrb1WKBCdd
X-Received: by 10.107.3.220 with SMTP id e89mr18130523ioi.99.1456757458689;
	Mon, 29 Feb 2016 06:50:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 06:50:39 -0800 (PST)
In-Reply-To: <5648c9e910e63de9aa29e1625ddab5e3804f179e.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<5648c9e910e63de9aa29e1625ddab5e3804f179e.1456327117.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 14:50:39 +0000
Message-ID: <CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] cve-check.bbclass: Add class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 14:50:58 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7cd98d27052ce9c6eb

--001a113f0e7cd98d27052ce9c6eb
Content-Type: text/plain; charset=UTF-8

On 24 February 2016 at 15:27, <mariano.lopez@linux.intel.com> wrote:

> +# Whitelist for packages (PN)
> +cve_check_pn_whitelist () {
> +    glibc-locale
> +}


Why is this a shell function?  CVE_CHECK_PN_WHITELIST = "glibc-locale"
please.

+# Whitelist for CVE and version of package
> +python cve_check_cve_whitelist () {
> +    {"CVE-2014-2524": ("6.3",), \
> +    }
> +}


Why is this a Python function?  Make it a bare string with implied
formatting and it can be extended from outside this class, where as this
can't.


> +addtask cve_check before do_build
>

If you're expecting to look at the sources, you'll want to be after
do_fetch too.


> +do_cve_check[depends] = "cve-check-tool-native:do_populate_cve_db"
>


And cve-check-tool-native:do_populate_sysroot.


> +def get_patches_cves(d):
> +    """
> +    Get patches that solve CVEs using the "CVE: " tag.
> +    """
> +
> +    import re
> +
> +    pn = d.getVar("PN", True)
> +    cve_match = re.compile("CVE:( CVE\-\d+\-\d+)+")
>

How does this work as the backslashes are escaping the - and d and d?  Use
r"" strings.

+    patched_cves = set()
> +    for url in src_patches(d):
> +        patch_file = bb.fetch.decodeurl(url)[2]
> +        with open(patch_file, "r") as f:
> +            patch_text = f.read()
> +
> +        # Search for the "CVE: " line
> +        match = cve_match.search(patch_text)
> +        if match:
> +            # Get only the CVEs without the "CVE: " tag
> +            cves = patch_text[match.start()+5:match.end()]
> +            for cve in cves.split():
> +                patched_cves.add(cve)
>
>
Breaks for patches such as this in glibc:

meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch:CVE: CVE-2015-9761
patch #1

I'd probably look for a line that starts with "CVE:" and the use re.findall
to find all strings matching r"CVE-\d{4}-\d+"


> +    # It is needed to export the proxies to download the database using
> HTTP
> +    export_proxies(d)
>

The database has already been downloaded hasn't it?


> +    # Write the faux CSV file to be used with cve-check-tool
> +    fd, faux = tempfile.mkstemp(prefix="cve-faux-")
> +    with os.fdopen(fd, "w") as f:
> +        f.write("%s,%s,%s," % (bpn, pv, cves))
>
>
Put this inside the try incase the write fails so the file will still be
deleted.


> +    cmd += " %s" % faux
> +    try:
> +        popen = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,
> stderr=subprocess.PIPE)
> +        output, error = popen.communicate()
>

Don't use the low-level function, the higher level helpers are clearer.

Always write cmd as a list unless you *need* the shell.

try:
    subprocess.check_output(cmd, stderr=subprocess.STDOUT)
except CommandCalledException as e:
    bb.warn("Couldn't check for CVEs: %s (output %s)" % (e, e.output))

+def get_cve_info(d, cves):
> +    """
> +    Get CVE information from the database used by cve-check-tool.
> +    """
> +
> +    try:
> +        import sqlite3
> +    except ImportError:
> +        from pysqlite2 import dbapi2 as sqlite3
>

Isn't the output from cve-check-tool good enough?  Would it be nicer to
extend the log instead of assuming that the database format won't ever
change?

+def cve_write_data(d, patched, unpatched, cve_data):
> +    """
> +    Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
> +    CVE manifest if enabled.
> +    """
> +
> +    from bb.utils import mkdirhier
> +
> +    cve_file = d.getVar("CVE_CHECK_LOCAL_FILE", True)
> +    nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
> +    write_string = ""
> +    mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR", True))
> +
> +    for cve in sorted(cve_data):
> +        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN", True)
> +        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV", True)
> +        write_string += "CVE: %s\n" % cve
> +        if cve in patched:
> +            write_string += "CVE STATUS: Patched\n"
> +        else:
> +            write_string += "CVE STATUS: Unpatched\n"
> +            bb.warn("Found unpatched CVE, for more information check %s"
> % cve_file)
> +        write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
> +        write_string += "CVSS v2 BASE SCORE: %s\n" %
> cve_data[cve]["score"]
> +        write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
> +        write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
> +
> +    with open(cve_file, "w") as f:
> +        f.write(write_string)
>

Just write to the file instead of to a temporary string.

Ross

--001a113f0e7cd98d27052ce9c6eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 February 2016 at 15:27,  <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:mariano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez=
@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">+# Whitelist for packages (PN)<br>
+cve_check_pn_whitelist () {<br>
+=C2=A0 =C2=A0 glibc-locale<br>
+}</blockquote><div><br></div><div>Why is this a shell function?=C2=A0 CVE_=
CHECK_PN_WHITELIST =3D &quot;glibc-locale&quot; please.=C2=A0</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex">
+# Whitelist for CVE and version of package<br>
+python cve_check_cve_whitelist () {<br>
+=C2=A0 =C2=A0 {&quot;CVE-2014-2524&quot;: (&quot;6.3&quot;,), \<br>
+=C2=A0 =C2=A0 }<br>
+}</blockquote><div><br></div><div>Why is this a Python function?=C2=A0 Mak=
e it a bare string with implied formatting and it can be extended from outs=
ide this class, where as this can&#39;t.</div><div>=C2=A0=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding=
-left:1ex">+addtask cve_check before do_build<br></blockquote><div><br></di=
v><div>If you&#39;re expecting to look at the sources, you&#39;ll want to b=
e after do_fetch too.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-colo=
r:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
+do_cve_check[depends] =3D &quot;cve-check-tool-native:do_populate_cve_db&q=
uot;<br></blockquote><div><br></div><div><br></div><div>And cve-check-tool-=
native:do_populate_sysroot.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+def get=
_patches_cves(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Get patches that solve CVEs using the &quot;CVE: &quot; tag.=
<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 import re<br>
+<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&quot;PN&quot;, True)<br>
+=C2=A0 =C2=A0 cve_match =3D re.compile(&quot;CVE:( CVE\-\d+\-\d+)+&quot;)<=
br></blockquote><div><br></div><div>How does this work as the backslashes a=
re escaping the - and d and d?=C2=A0 Use r&quot;&quot; strings.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">+=C2=A0 =C2=A0 patched_cves =3D set()<br>
+=C2=A0 =C2=A0 for url in src_patches(d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_file =3D bb.fetch.decodeurl(url)[2]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(patch_file, &quot;r&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_text =3D f.read()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Search for the &quot;CVE: &quot; line<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D cve_match.search(patch_text)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get only the CVEs without the =
&quot;CVE: &quot; tag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cves =3D patch_text[match.start(=
)+5:match.end()]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in cves.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves.add(c=
ve)<br><br></blockquote><div><br></div><div>Breaks for patches such as this=
 in glibc:</div><div><br></div><div>meta/recipes-core/glibc/glibc/CVE-2015-=
9761_1.patch:CVE: CVE-2015-9761 patch #1</div><div><br></div><div>I&#39;d p=
robably look for a line that starts with &quot;CVE:&quot; and the use re.fi=
ndall to find all strings matching r&quot;CVE-\d{4}-\d+&quot;</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">+=C2=A0 =C2=A0 # It is needed to export the proxi=
es to download the database using HTTP<br>
+=C2=A0 =C2=A0 export_proxies(d)<br></blockquote><div><br></div><div>The da=
tabase has already been downloaded hasn&#39;t it?</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex">
+=C2=A0 =C2=A0 # Write the faux CSV file to be used with cve-check-tool<br>
+=C2=A0 =C2=A0 fd, faux =3D tempfile.mkstemp(prefix=3D&quot;cve-faux-&quot;=
)<br>
+=C2=A0 =C2=A0 with os.fdopen(fd, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;%s,%s,%s,&quot; % (bpn, pv, cves=
))<br><br></blockquote><div><br></div><div>Put this inside the try incase t=
he write fails so the file will still be deleted.</div><div>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
+=C2=A0 =C2=A0 cmd +=3D &quot; %s&quot; % faux<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 popen =3D subprocess.Popen(cmd, shell=3DTrue, =
stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output, error =3D popen.communicate()<br></blo=
ckquote><div><br></div><div>Don&#39;t use the low-level function, the highe=
r level helpers are clearer.</div><div><br></div><div>Always write cmd as a=
 list unless you *need* the shell.</div><div><br></div><div>try:</div><div>=
=C2=A0 =C2=A0 subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)</div=
><div>except CommandCalledException as e:</div><div>=C2=A0 =C2=A0 bb.warn(&=
quot;Couldn&#39;t check for CVEs: %s (output %s)&quot; % (e, e.output))</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex">+def get_cve_info(d, cves):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Get CVE information from the database used by cve-check-tool=
.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import sqlite3<br>
+=C2=A0 =C2=A0 except ImportError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 from pysqlite2 import dbapi2 as sqlite3<br>
</blockquote><div><br></div><div>Isn&#39;t the output from cve-check-tool g=
ood enough?=C2=A0 Would it be nicer to extend the log instead of assuming t=
hat the database format won&#39;t ever change?</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-l=
eft:1ex">+def cve_write_data(d, patched, unpatched, cve_data):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and<=
br>
+=C2=A0 =C2=A0 CVE manifest if enabled.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 from bb.utils import mkdirhier<br>
+<br>
+=C2=A0 =C2=A0 cve_file =3D d.getVar(&quot;CVE_CHECK_LOCAL_FILE&quot;, True=
)<br>
+=C2=A0 =C2=A0 nvd_link =3D &quot;<a href=3D"https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3D" rel=3D"noreferrer" target=3D"_blank">https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3D</a>&quot;<br>
+=C2=A0 =C2=A0 write_string =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 mkdirhier(d.getVar(&quot;CVE_CHECK_LOCAL_DIR&quot;, True))<b=
r>
+<br>
+=C2=A0 =C2=A0 for cve in sorted(cve_data):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;PACKAGE NAME: %s\n&quo=
t; % d.getVar(&quot;PN&quot;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;PACKAGE VERSION: %s\n&=
quot; % d.getVar(&quot;PV&quot;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE: %s\n&quot; % cve<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve in patched:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE STAT=
US: Patched\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE STAT=
US: Unpatched\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Found unpatched CV=
E, for more information check %s&quot; % cve_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE SUMMARY: %s\n&quot=
; % cve_data[cve][&quot;summary&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVSS v2 BASE SCORE: %s=
\n&quot; % cve_data[cve][&quot;score&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;VECTOR: %s\n&quot; % c=
ve_data[cve][&quot;vector&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;MORE INFORMATION: %s%s=
\n\n&quot; % (nvd_link, cve)<br>
+<br>
+=C2=A0 =C2=A0 with open(cve_file, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(write_string)<br></blockquote><div><br=
></div><div>Just write to the file instead of to a temporary string.</div><=
div><br></div><div>Ross</div></div></div></div>

--001a113f0e7cd98d27052ce9c6eb--
