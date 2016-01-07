Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 37A696011A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:17:19 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z14so51409103igp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 05:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GuvE5JKJEGWDJX/jsBZK/YofDE1+eqhTCl5elLkBZx8=;
	b=scFkxUt8eA1Vx+3nr/p//eN7NQva1LIsHllTw2PB/nUOeNF0iDGk+cK7ObYJQlxcO4
	SfCymggvloXoR2+vQY0ZrNpYgNfVYCRt6QbLlmyaDqGITKPyhQkg8ishb/+LeLAErIbW
	ELpKvk8SE3Nhx+LQfCZm8CZbYM5a2tKGhtIHb0tP9+iqyZap3gjIZwBfFE3RrRsWlaM8
	Q7svpd/fFNF07Udx5zcV01GGXC67lrAvMR7mV/gI6gXjxROi9yxHUiOYL0C3TatIoZoW
	zlZOkvUGPjXEpBbRRDI+UATtepn5XNs/hG6YGDnDUTjUJ4I1DQ9IQFLEStxSKTUFcT86
	2/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GuvE5JKJEGWDJX/jsBZK/YofDE1+eqhTCl5elLkBZx8=;
	b=NV+smov6gJKHvjFWGGRvoYGep1/uvEbWgq6H68tveJzy5ygFzkB1o6fm6E9IvMUnmo
	ztkpRQoEKdj+EOxr3moyE4Fhbpyg2nZ+bB0xEranrMlzfXjkWbf9SfogY+fKo9ze8O29
	A25dqRdAZcEDASwREKl+IHsTSXsA0CywnnL2LxSfE7eNrzM9ctJ322RuIa3Bcs3nuFdf
	V2kL03mzoukvBXq0fmp02MKnP1V9h6mJ8C6ake9GWQ5So3ppAmJnWlEMGfViKjeTjI/l
	TZRJLc/GTMEc7WVzM1M0Jefw5s0bt0s76NvIkweThFXlitjt/YtQpUFp52g8uiu/dipK
	AAIg==
X-Gm-Message-State: ALoCoQnI3+2xIQosfQMu/thgkXKUQhfvhnAuvgjVAVA1Qhp/qaBZvIOsTBFW5OldKL+qrCOAt+BRNdFTb7lW1wL0RhANr07mINdXz88zYLBLA12CQhs0R0A=
X-Received: by 10.50.111.111 with SMTP id ih15mr13614813igb.78.1452172640633; 
	Thu, 07 Jan 2016 05:17:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 05:17:01 -0800 (PST)
In-Reply-To: <1448019722-24279-1-git-send-email-george.l.musat@intel.com>
References: <1448019722-24279-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 13:17:01 +0000
Message-ID: <CAJTo0Lb=TQVRZ5DMKGpFzwQtjWj+7kuVXcsyUL6OR1QcM85uwA@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added wifi tests.
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
X-List-Received-Date: Thu, 07 Jan 2016 13:17:22 -0000
Content-Type: multipart/alternative; boundary=089e0149be3465e9c40528be4a5a

--089e0149be3465e9c40528be4a5a
Content-Type: text/plain; charset=UTF-8

On 20 November 2015 at 11:42, Lucian Musat <george.l.musat@intel.com> wrote:

> +    def check_wifi_ip(self):
> +        time.sleep(3)
>

Why a sleep here?  Why none of the other tests?


> +        # Check ip address by ifconfig command
> +        wifi_interface = "nothing"
> +        (status, wifi_interface) = self.target.run("ifconfig | grep
> '^wlp\|^wlan' | awk '{print $1}'")
>

No need to grep and awk, just use a pattern match in awk.


> +    def test_check_wifi_capable(self):
> +        (status, output) = self.target.run('cp /proc/config.gz .; gunzip
> config.gz; cat config | grep CONFIG_IWLWIFI=')
>

"gunzip -c" will write to stdout, so this can be replaced with gunzip -c
/proc/config.gz | grep -q CONFIG_IWLWIFI=.


> --- /dev/null
> +++ b/meta/lib/oeqa/utils/helper.py
> @@ -0,0 +1,62 @@
> +#[PROTEXCAT]
> +#\License: ALL RIGHTS RESERVED
> +#\Author: Wang, Jing <jing.j.wang@intel.com>
>

What's [PROTEXCAT] mean?  That license isn't right for something that's
meant to be in oe-core (typically, MIT).


> +def shell_cmd(cmd):
> +    """Execute shell command till it return"""
> +    cmd_proc = subprocess.Popen(cmd, shell=True)
> +    return cmd_proc.wait() if cmd_proc else -1
>

This is just a bad reimplementation of subprocess.call().  Use call().


> +def shell_cmd_timeout(cmd, timeout=0):
> +    """Execute shell command till timeout"""
> +    cmd_proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
> +    if not cmd_proc:
> +        return -1, ''
>

How is subproccess.Popen() expected to return something that evaluates to
false?  This can't happen.


> +    t_timeout, tick = timeout, 2
> +    ret, output = None, ''
> +    while True:
> +        time.sleep(tick)
> +        output = cmd_proc.communicate()[0]
> +        ret = cmd_proc.poll()
> +        if ret is not None:
> +            break
> +
> +        if t_timeout > 0:
> +            t_timeout -= tick
> +
> +        if t_timeout <= 0:
> +            # timeout, kill command
> +            cmd_proc.kill()
> +            ret = -99999
> +            break
> +    return ret, output
>

sshcontrol has a neater way of doing this.  I'm wondering why we don't just
install expect on the target instead of assuming the host has expect and
doing ssh-in-expect.

+def collect_pnp_log(casename, logname, log):
> +    """collect the result log for pnp part"""
> +    curpath = os.getcwd()
> +    if not os.path.exists(casename):
> +        os.makedirs(casename)
> +
> +    logpath = os.path.join(curpath, casename, logname)
> +    logtime = time.strftime("%Y-%m-%d %H:%M:%S")
> +    with open(logpath, "a") as text_file:
> +        text_file.write("%s %s:%s\n" %(logtime, casename, log))
>
> Nothing uses this.


> +def get_files_dir():
> +    """Get directory of supporting files"""
> +    pkgarch = oeRuntimeTest.tc.d.getVar('MACHINE', True)
> +    deploydir = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True)
> +    return os.path.join(deploydir, "files", "target", pkgarch)
>

Or this.


> +def get_native_dir():
> +    """Get directory of native files"""
> +    arch = oeRuntimeTest.tc.d.getVar('BUILD_ARCH', True)
> +    deploydir = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True)
> +    return os.path.join(deploydir, "files", "native", arch)
>

Or this.

Ross

--089e0149be3465e9c40528be4a5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 November 2015 at 11:42, Lucian Musat <span dir=3D"lt=
r">&lt;<a href=3D"mailto:george.l.musat@intel.com" target=3D"_blank">george=
.l.musat@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+=C2=A0 =C2=A0 def ch=
eck_wifi_ip(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(3)<br></blockquote><div><br></div><=
div>Why a sleep here?=C2=A0 Why none of the other tests?</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check ip address by ifconfig command<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wifi_interface =3D &quot;nothing&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, wifi_interface) =3D self.target.run(&=
quot;ifconfig | grep &#39;^wlp\|^wlan&#39; | awk &#39;{print $1}&#39;&quot;=
)<br></blockquote><div><br></div><div>No need to grep and awk, just use a p=
attern match in awk.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+=
=C2=A0 =C2=A0 def test_check_wifi_capable(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;cp /=
proc/config.gz .; gunzip config.gz; cat config | grep CONFIG_IWLWIFI=3D&#39=
;)<br></blockquote><div><br></div><div>&quot;gunzip -c&quot; will write to =
stdout, so this can be replaced with gunzip -c /proc/config.gz | grep -q CO=
NFIG_IWLWIFI=3D.</div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>--- /dev/null<br>
+++ b/meta/lib/oeqa/utils/helper.py<br>
@@ -0,0 +1,62 @@<br>
+#[PROTEXCAT]<br>
+#\License: ALL RIGHTS RESERVED<br>
+#\Author: Wang, Jing &lt;<a href=3D"mailto:jing.j.wang@intel.com">jing.j.w=
ang@intel.com</a>&gt;<br>
</blockquote><div><br></div><div>What&#39;s [PROTEXCAT] mean?=C2=A0 That li=
cense isn&#39;t right for something that&#39;s meant to be in oe-core (typi=
cally, MIT).=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+de=
f shell_cmd(cmd):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Execute shell command till it return&quot;=
&quot;&quot;<br>
+=C2=A0 =C2=A0 cmd_proc =3D subprocess.Popen(cmd, shell=3DTrue)<br>
+=C2=A0 =C2=A0 return cmd_proc.wait() if cmd_proc else -1<br>
</blockquote><div><br></div><div>This is just a bad reimplementation of sub=
process.call().=C2=A0 Use call().</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
+def shell_cmd_timeout(cmd, timeout=3D0):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Execute shell command till timeout&quot;&q=
uot;&quot;<br>
+=C2=A0 =C2=A0 cmd_proc =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3Dsu=
bprocess.PIPE)<br>
+=C2=A0 =C2=A0 if not cmd_proc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1, &#39;&#39;<br></blockquote><div><br=
></div><div>How is subproccess.Popen() expected to return something that ev=
aluates to false?=C2=A0 This can&#39;t happen.</div><div>=C2=A0<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 t_timeout, tick =3D timeout, 2<br>
+=C2=A0 =C2=A0 ret, output =3D None, &#39;&#39;<br>
+=C2=A0 =C2=A0 while True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(tick)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D cmd_proc.communicate()[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D cmd_proc.poll()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ret is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if t_timeout &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t_timeout -=3D tick<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if t_timeout &lt;=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # timeout, kill command<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_proc.kill()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -99999<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 return ret, output<br></blockquote><div><br></div><div>sshco=
ntrol has a neater way of doing this.=C2=A0 I&#39;m wondering why we don&#3=
9;t just install expect on the target instead of assuming the host has expe=
ct and doing ssh-in-expect.</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">+def collect_pnp_log(casename, logname, log):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;collect the result log for pnp part&quot;&=
quot;&quot;<br>
+=C2=A0 =C2=A0 curpath =3D os.getcwd()<br>
+=C2=A0 =C2=A0 if not os.path.exists(casename):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(casename)<br>
+<br>
+=C2=A0 =C2=A0 logpath =3D os.path.join(curpath, casename, logname)<br>
+=C2=A0 =C2=A0 logtime =3D time.strftime(&quot;%Y-%m-%d %H:%M:%S&quot;)<br>
+=C2=A0 =C2=A0 with open(logpath, &quot;a&quot;) as text_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 text_file.write(&quot;%s %s:%s\n&quot; %(logti=
me, casename, log))<br><br></blockquote><div>Nothing uses this.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
+def get_files_dir():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Get directory of supporting files&quot;&qu=
ot;&quot;<br>
+=C2=A0 =C2=A0 pkgarch =3D oeRuntimeTest.tc.d.getVar(&#39;MACHINE&#39;, Tru=
e)<br>
+=C2=A0 =C2=A0 deploydir =3D oeRuntimeTest.tc.d.getVar(&#39;DEPLOY_DIR&#39;=
, True)<br>
+=C2=A0 =C2=A0 return os.path.join(deploydir, &quot;files&quot;, &quot;targ=
et&quot;, pkgarch)<br></blockquote><div>=C2=A0</div><div>Or this.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
+def get_native_dir():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Get directory of native files&quot;&quot;&=
quot;<br>
+=C2=A0 =C2=A0 arch =3D oeRuntimeTest.tc.d.getVar(&#39;BUILD_ARCH&#39;, Tru=
e)<br>
+=C2=A0 =C2=A0 deploydir =3D oeRuntimeTest.tc.d.getVar(&#39;DEPLOY_DIR&#39;=
, True)<br>
+=C2=A0 =C2=A0 return os.path.join(deploydir, &quot;files&quot;, &quot;nati=
ve&quot;, arch)<br></blockquote><div><br></div><div>Or this.</div><div><br>=
</div><div>Ross</div></div></div></div>

--089e0149be3465e9c40528be4a5a--
