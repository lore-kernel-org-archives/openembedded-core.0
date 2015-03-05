Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8027265C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 06:26:13 +0000 (UTC)
Received: by igkb16 with SMTP id b16so43351387igk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 22:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=jWntgyo9EN5JL3VFdkanz7hcS/2ilQACRZ9Gv9RWxhw=;
	b=dibQdVu4E3Z1q7Cgd3r+tvK7fsAMLz90ACh/0CpsuKQ7Oxo+4R2b5FA7Bb3KV7WItX
	moqHz4E3cwWXZB8x953KnQmxhe2TkLVe92b1vCWofedG429Xq1k+lavn3no1FYNOZgFr
	0D8aaEHQFAnnGvNACxRefIu/AqzCG38vAzChq2SPNpFzt2gatGIQXywW4GS+Huums357
	aLH0lbR3+49w3y842DPUz0jHq8JIASTUbfCAzQI+PveCbNYitSzCDM7p4Y/y7wmt0WvN
	Chsxb0c+UCJffuNoJe4hyIeN/cUtXFkAMQZpFERgxBCNgs7IqJrZBaUMY5wo1pWScrOn
	Lr/w==
X-Gm-Message-State: ALoCoQnRI0zs9PpHioAKWUXDpbXhsMukYxQza/bzb3oOFY6oGMcSmSGS7hL23+flGOn3AocKgxNZ
MIME-Version: 1.0
X-Received: by 10.50.147.99 with SMTP id tj3mr17906262igb.41.1425536773950;
	Wed, 04 Mar 2015 22:26:13 -0800 (PST)
Received: by 10.107.46.169 with HTTP; Wed, 4 Mar 2015 22:26:13 -0800 (PST)
In-Reply-To: <1425380477-16279-1-git-send-email-baptiste.durand@gmail.com>
References: <1425380477-16279-1-git-send-email-baptiste.durand@gmail.com>
Date: Thu, 5 Mar 2015 00:26:13 -0600
Message-ID: <CALXw4G7QHYx5340MaDKX4vdYLFd7p1d1U5teKKAAP7ECkTav1A@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: Baptiste DURAND <baptiste.durand@gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: Add syntax check on MACHINE variable
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
X-List-Received-Date: Thu, 05 Mar 2015 06:26:15 -0000
Content-Type: multipart/alternative; boundary=089e013d052006cbdd051084a5e3

--089e013d052006cbdd051084a5e3
Content-Type: text/plain; charset=UTF-8

Why? Uppercase letters should be allowed and work fine for the most part.
Below are a few excerpts from last year:

On Wed, Mar 5, 2014 at 11:45 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:
On Wednesday 05 March 2014 11:00:31 Michael Gloff wrote:
> On Mon, Mar 3, 2014 at 12:52 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com
>
> > wrote:
> > > On Sunday 02 March 2014 19:58:41 Michael Gloff wrote:
> > > > Is there a reason why the toolchain cannot be built with a machine
> name
> > > > that contains capital letters? Seems weird, everything else builds
> fine,
> > > > but meta-toolchain fails complaining about caps.
> > >
> > > Although machine names are traditionally all lower case in our build
> > > system, there's no deliberate restriction in place that enforces this.
> > >
> > > Would you be able to provide more details, such as the version of the
> > > build system you are using, the exact capital letters you used in the
> > > machine name, and the error you received?
> >
> > The error is below. Machine name: PMX-090T. This is on dora 1.5.1
> >
> > ERROR: Function failed: opkg-build execution failed
> > ERROR: Logfile of failure stored in:
> >
> /opt/oe/build/tmp/work/i686-nativesdk-emacsdk-linux/meta-environment-PMX-090
> > T/1.0-r8/temp/log.do_package_write_ipk.15358
> > Log data follows:
> > | DEBUG: Executing python function sstate_task_prefunc
> > | DEBUG: Python function sstate_task_prefunc finished
> > | DEBUG: Executing python function do_package_write_ipk
> > | DEBUG: Executing python function read_subpackage_metadata
> > | DEBUG: Python function read_subpackage_metadata finished
> > | DEBUG: Executing python function do_package_ipk
> > | meta-environment-PMX-090T
> > | *** Error: Package name  contains illegal characters, (other than
> > [a-z0-9.+-])
>
> Perhaps I spoke too soon. There might not be a direct restriction on
> machine
> names; but opkg does restrict characters allowed in package names, and for
> meta-environment the machine name ends up as part of the package name. You
> could probably hack around it if you felt the need to, but the simplest
> thing
> would be to just change the machine name to be all lower-case.
>
> Cheers,
> Paul
>

=============================================================================================
Paul Barker <paul@paulbarker.me.uk>
3/6/14


to Khem, me, Paul, Yocto
On 5 March 2014 21:14, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 5, 2014 at 9:00 AM, Michael Gloff <mgloff@emacinc.com> wrote:
>> | *** Error: Package name  contains illegal characters, (other than
>> [a-z0-9.+-])
>
> hmm meta-environment-PMX-090T is a package name and
> thats limitation of opkg backend, if you are too tied to

opkg itself doesn't seem to have this limitation, I just created and
installed a
test package named 'A' perfectly fine.

The Debian policy says:
    Package names (both source and binary, see Package, Section 5.6.7) must
    consist only of lower case letters (a-z), digits (0-9), plus (+) and
minus
    (-) signs, and periods (.). They must be at least two characters long
and
    must start with an alphanumeric character.

So I think the restriction is there to keep generated packages
compatible with dpkg-deb.

We could consider removing the restriction if that compatibility isn't
necessary.

===========================================================================

I think we should fix the SDK generation that has a problem with caps
instead of dis-allowing it completely.

Michael Gloff



On Tue, Mar 3, 2015 at 5:01 AM, Baptiste DURAND <baptiste.durand@gmail.com>
wrote:

> MACHINE variable should not contain uppercase characters.
>
> Having uppercase in Machine name can lead to this kind of error : (here
> Machine is set to nuc-E3815)
> ERROR: initramfs-live-boot not found in the base feeds (nuc_E3815
> corei7-64-intel-common corei7-64 core2-64 x86_64 noarch any all).
>
> Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 31b99d4..1fa2e58 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -713,12 +713,17 @@ def check_sanity_everybuild(status, d):
>
>      # Check that the MACHINE is valid, if it is set
>      machinevalid = True
> -    if d.getVar('MACHINE', True):
> -        if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
> -            status.addresult('Please set a valid MACHINE in your
> local.conf or environment\n')
> -            machinevalid = False
> +    machinevar = d.getVar('MACHINE', True)
> +    if machinevar:
> +        if machinevar == machinevar.lower():
> +            if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
> +               status.addresult('Please set a valid MACHINE in your
> local.conf or environment\n')
> +               machinevalid = False
> +            else:
> +               status.addresult(check_sanity_validmachine(d))
>          else:
> -            status.addresult(check_sanity_validmachine(d))
> +            status.addresult('Please set a valid MACHINE : uppercase
> characters are not allowed in machine name : ${MACHINE} should be ' +
> machinevar.lower() + ' \n    Please rename file
> conf/machine/${MACHINE}.conf as conf/machine/' + machinevar.lower() +
> '.conf\n')
> +            machinevalid = False
>      else:
>          status.addresult('Please set a MACHINE in your local.conf or
> environment\n')
>          machinevalid = False
> --
> 1.8.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e013d052006cbdd051084a5e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why? Uppercase letters should be allowed and work fine for=
 the most part. Below are a few excerpts from last year:<br><br>On Wed, Mar=
 5, 2014 at 11:45 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto=
:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel=
.com</a>&gt;</span> wrote:<br>
On Wednesday 05 March 2014 11:00:31 Michael Gloff wrote:<br>
&gt; On Mon, Mar 3, 2014 at 12:52 PM, Paul Eggleton<br>
&gt; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank"=
>paul.eggleton@linux.intel.com</a><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; wrote:<br>
&gt; &gt; On Sunday 02 March 2014 19:58:41 Michael Gloff wrote:<br>
&gt; &gt; &gt; Is there a reason why the toolchain cannot be built with a m=
achine name<br>
&gt; &gt; &gt; that contains capital letters? Seems weird, everything else =
builds fine,<br>
&gt; &gt; &gt; but meta-toolchain fails complaining about caps.<br>
&gt; &gt;<br>
&gt; &gt; Although machine names are traditionally all lower case in our bu=
ild<br>
&gt; &gt; system, there&#39;s no deliberate restriction in place that enfor=
ces this.<br>
&gt; &gt;<br>
&gt; &gt; Would you be able to provide more details, such as the version of=
 the<br>
&gt; &gt; build system you are using, the exact capital letters you used in=
 the<br>
&gt; &gt; machine name, and the error you received?<br>
&gt;<br>
&gt; The error is below. Machine name: PMX-090T. This is on dora 1.5.1<br>
&gt;<br>
&gt; ERROR: Function failed: opkg-build execution failed<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /opt/oe/build/tmp/work/i686-nativesdk-emacsdk-linux/meta-environment-P=
MX-090<br>
&gt; T/1.0-r8/temp/log.do_package_write_ipk.15358<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing python function sstate_task_prefunc<br>
&gt; | DEBUG: Python function sstate_task_prefunc finished<br>
&gt; | DEBUG: Executing python function do_package_write_ipk<br>
&gt; | DEBUG: Executing python function read_subpackage_metadata<br>
&gt; | DEBUG: Python function read_subpackage_metadata finished<br>
&gt; | DEBUG: Executing python function do_package_ipk<br>
&gt; | meta-environment-PMX-090T<br>
&gt; | *** Error: Package name =C2=A0contains illegal characters, (other th=
an<br>
&gt; [a-z0-9.+-])<br>
<br>
Perhaps I spoke too soon. There might not be a direct restriction on machin=
e<br>
names; but opkg does restrict characters allowed in package names, and for<=
br>
meta-environment the machine name ends up as part of the package name. You<=
br>
could probably hack around it if you felt the need to, but the simplest thi=
ng<br>
would be to just change the machine name to be all lower-case.<br>
<br>
Cheers,<br>
Paul<div class=3D""><div id=3D":1js" class=3D"" tabindex=3D"0"><img class=
=3D"" src=3D"https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif">=
</div></div></blockquote><div><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br><table class=3D"" cellpadding=3D"0"><tbody><tr class=3D"=
"><td class=3D""><table class=3D"" cellpadding=3D"0"><tbody><tr><td><h3 cla=
ss=3D""><span name=3D"Paul Barker" class=3D"">Paul Barker</span> <span clas=
s=3D""><span>&lt;</span><a href=3D"mailto:paul@paulbarker.me.uk">paul@paulb=
arker.me.uk</a><span>&gt;</span></span> </h3></td></tr></tbody></table></td=
><td class=3D""><div class=3D""><span></span><span id=3D":1jd" class=3D"" t=
itle=3D"Thu, Mar 6, 2014 at 6:57 AM" alt=3D"Thu, Mar 6, 2014 at 6:57 AM">3/=
6/14</span><div class=3D"" tabindex=3D"0" style=3D"outline:0px none"><span =
class=3D""><img class=3D"" src=3D"https://mail.google.com/mail/u/0/images/c=
leardot.gif" alt=3D""></span></div></div></td><td class=3D""><br></td><td c=
lass=3D"" rowspan=3D"2"><br></td></tr><tr class=3D""><td colspan=3D"3"><tab=
le class=3D"" cellpadding=3D"0"><tbody><tr><td class=3D""><div class=3D""><=
span class=3D"">to <span dir=3D"ltr" name=3D"Khem" class=3D"">Khem</span>, =
<span dir=3D"ltr" name=3D"me" class=3D"">me</span>, <span dir=3D"ltr" name=
=3D"Paul" class=3D"">Paul</span>, <span dir=3D"ltr" name=3D"Yocto" class=3D=
"">Yocto</span> </span></div><div class=3D""><img class=3D"" id=3D":3b" src=
=3D"https://mail.google.com/mail/u/0/images/cleardot.gif" alt=3D""></div></=
td></tr></tbody></table></td></tr></tbody></table>On 5 March 2014 21:14, Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt; On Wed, Mar 5, 2014 at 9:00 AM, Michael Gloff &lt;<a href=3D"mailto:mg=
loff@emacinc.com">mgloff@emacinc.com</a>&gt; wrote:<br>
&gt;&gt; | *** Error: Package name=C2=A0 contains illegal characters, (othe=
r than<br>
&gt;&gt; [a-z0-9.+-])<br>
&gt;<br>
&gt; hmm meta-environment-PMX-090T is a package name and<br>
&gt; thats limitation of opkg backend, if you are too tied to<br>
<br>
opkg itself doesn&#39;t seem to have this limitation, I just created and in=
stalled a<br>
test package named &#39;A&#39; perfectly fine.<br>
<br>
The Debian policy says:<br>
=C2=A0 =C2=A0 Package names (both source and binary, see Package, Section 5=
.6.7) must<br>
=C2=A0 =C2=A0 consist only of lower case letters (a-z), digits (0-9), plus =
(+) and minus<br>
=C2=A0 =C2=A0 (-) signs, and periods (.). They must be at least two charact=
ers long and<br>
=C2=A0 =C2=A0 must start with an alphanumeric character.<br>
<br>
So I think the restriction is there to keep generated packages<br>
compatible with dpkg-deb.<br>
<br>
We could consider removing the restriction if that compatibility isn&#39;t<=
br>
necessary.<div class=3D""><div id=3D":2w8" class=3D"" tabindex=3D"0"><img c=
lass=3D"" src=3D"https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.g=
if"><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br><br></div><div id=3D":2w8" class=3D"" tabindex=3D"0">I think w=
e should fix the SDK generation that has a problem with caps instead of dis=
-allowing it completely. <br><br></div><div id=3D":2w8" class=3D"" tabindex=
=3D"0">Michael Gloff<br></div></div>=C2=A0</div><br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Tue, Mar 3, 2015 at 5:01 AM, Ba=
ptiste DURAND <span dir=3D"ltr">&lt;<a href=3D"mailto:baptiste.durand@gmail=
.com" target=3D"_blank">baptiste.durand@gmail.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">MACHINE variable should not contain uppercas=
e characters.<br>
<br>
Having uppercase in Machine name can lead to this kind of error : (here Mac=
hine is set to nuc-E3815)<br>
ERROR: initramfs-live-boot not found in the base feeds (nuc_E3815 corei7-64=
-intel-common corei7-64 core2-64 x86_64 noarch any all).<br>
<br>
Signed-off-by: Baptiste DURAND &lt;<a href=3D"mailto:baptiste.durand@gmail.=
com">baptiste.durand@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sanity.bbclass | 15 ++++++++++-----<br>
=C2=A01 file changed, 10 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 31b99d4..1fa2e58 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -713,12 +713,17 @@ def check_sanity_everybuild(status, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Check that the MACHINE is valid, if it is set<br>
=C2=A0 =C2=A0 =C2=A0machinevalid =3D True<br>
-=C2=A0 =C2=A0 if d.getVar(&#39;MACHINE&#39;, True):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not check_conf_exists(&quot;conf/machine/${=
MACHINE}.conf&quot;, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&#39;Please set=
 a valid MACHINE in your local.conf or environment\n&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 machinevalid =3D False<br>
+=C2=A0 =C2=A0 machinevar =3D d.getVar(&#39;MACHINE&#39;, True)<br>
+=C2=A0 =C2=A0 if machinevar:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if machinevar =3D=3D machinevar.lower():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not check_conf_exists(&quot;c=
onf/machine/${MACHINE}.conf&quot;, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(&#=
39;Please set a valid MACHINE in your local.conf or environment\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machinevalid =3D Fa=
lse<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(ch=
eck_sanity_validmachine(d))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(check_sanity_va=
lidmachine(d))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&#39;Please set=
 a valid MACHINE : uppercase characters are not allowed in machine name : $=
{MACHINE} should be &#39; + machinevar.lower() + &#39; \n=C2=A0 =C2=A0 Plea=
se rename file conf/machine/${MACHINE}.conf as conf/machine/&#39; + machine=
var.lower() + &#39;.conf\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 machinevalid =3D False<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(&#39;Please set a MACHIN=
E in your local.conf or environment\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machinevalid =3D False<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--089e013d052006cbdd051084a5e3--
