Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id DFC4560E49
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 15:10:26 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hs14so1057689lab.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 07:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lnyxcidsRdpfwOEg+bpigCG9hokz8X9RepIwmd5ukPI=;
	b=DBy+8devFcDEFgvcVCPVOqgtDoNayIT6KSB9uZD7C6v2Z4iBPEBi4JfTGcrEvHuOSC
	X0AxNQ9/uh00tGswFZAP/8bRrM5xk2iJ5K3/Vzxyv84kcrBkuCVMHnImrBWGAiwFqVbT
	B0xjVPARxECp7qqzIiyLkrwxz4fu1w8f0maboknx7D/x64cSlLNU997wF5VH2x/K5vD9
	Itp9jhVz4IW+onnvFNlAJB8g94i6rPfj46DJyYmO/CeJhjnf8NKxB+e1ihuzLCTJsbxQ
	6h3Vf8s0urO1mDaYzo/8HFcRO5qJoUWQkLS/7zeDwj1fMzV9q6baNTg7JhCxPm5+MMFZ
	PYkA==
X-Gm-Message-State: ALoCoQneQ4QswqH45Gwq5p1EWV8sh2FWwW5eH1eW2qeuUwiY1H2Es7D26DCaDt1WaVpeWXd4t36T
MIME-Version: 1.0
X-Received: by 10.112.171.225 with SMTP id ax1mr55777897lbc.40.1415113826262; 
	Tue, 04 Nov 2014 07:10:26 -0800 (PST)
Received: by 10.112.149.42 with HTTP; Tue, 4 Nov 2014 07:10:26 -0800 (PST)
In-Reply-To: <CAJTo0LaWb6ck-KYn8N-AG47xAHNEB2QP-AjXiB+nuWYqjFewgg@mail.gmail.com>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
	<1414753109.7649.91.camel@ted>
	<CAGNsrLDxfpu=X1k7CLREuQCe64z7UDhzQbt1S9rLvm4W5WogTg@mail.gmail.com>
	<CAJTo0LaWb6ck-KYn8N-AG47xAHNEB2QP-AjXiB+nuWYqjFewgg@mail.gmail.com>
Date: Tue, 4 Nov 2014 17:10:26 +0200
Message-ID: <CAGNsrLAPfA4=UH0GXkPeAmOx-GbJ7pnNF3gDaRixwNhNKw41og@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to 20140828 release
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
X-List-Received-Date: Tue, 04 Nov 2014 15:10:37 -0000
Content-Type: multipart/alternative; boundary=001a11c36daaee78f4050709dc95

--001a11c36daaee78f4050709dc95
Content-Type: text/plain; charset=UTF-8

Hi Ross, Richard,

On 31 October 2014 22:09, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 31 October 2014 12:46, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>
>> fwiw, it has been built and tested on armv7 and armv8 architectures, both
>> successfully.
>> Now I'm lokking why this issue is triggered on x86:
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/minnow/build/build/tmp/sysroots/minnow/usr/include/tirpc/rpc/rpc.h:74:61: fatal error: rpc/rpcb_clnt.h: No such file or directory
>>
>>
> Have a failure on ARM then:
>
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/85/steps/BuildImages/logs/stdio
>
> Presumably you didn't do a build from a clean tmp, whereas the autobuilder
> always does.  It's amazing how many missing build dependencies this picks
> up, which is precisely why the autobuilder does it.
>
> Ross
>

after a lot of finger-pointing and implying we don't test our changes or do
our homework or do clean builds:
* I've built ltp for armv7a and armv8 on our builders and it works fine
* I've built poky for x86 and it built fine

here's my steps:
$ git clone git://git.yoctoproject.org/poky
$ cd poky
$ source oe-init-build-env
$ patch -p1 < 0001-ltp-update-to-20140828-release.patch
$ bitbake ltp

$ ls -l tmp/deploy/rpm/i586/ltp-*
-rw-r--r-- 2 user user 55929600 Nov  4 16:28
tmp/deploy/rpm/i586/ltp-20140828-r0.i586.rpm
-rw-r--r-- 2 user user     3080 Nov  4 16:28
tmp/deploy/rpm/i586/ltp-dbg-20140828-r0.i586.rpm
-rw-r--r-- 2 user user     3264 Nov  4 16:28
tmp/deploy/rpm/i586/ltp-dev-20140828-r0.i586.rpm
-rw-r--r-- 2 user user    31884 Nov  4 16:28
tmp/deploy/rpm/i586/ltp-doc-20140828-r0.i586.rpm

afaict, the failure isn't related to the changes submitted. Could you be
kind enough to try to reproduce the build failure outside of the yocto
autobuilders? or give me the exact steps to reproduce the failure?

Cheers,
Fathi

--001a11c36daaee78f4050709dc95
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross, Richard,<br><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On 31 October 2014 22:09, Burton, Ross <span dir=3D"lt=
r">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burt=
on@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On =
31 October 2014 12:46, Fathi Boudra <span dir=3D"ltr">&lt;<a href=3D"mailto=
:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div>fwiw, it has been built and tested =
on armv7 and armv8 architectures, both successfully.<br></div><div>Now I&#3=
9;m lokking why this issue is triggered on x86:</div><div><pre style=3D"fon=
t-family:&#39;Courier New&#39;,courier,monotype,monospace;color:rgb(0,0,0);=
font-size:medium"><span>/home/pokybuild/yocto-autobuilder/yocto-worker/minn=
ow/build/build/tmp/sysroots/minnow/usr/include/tirpc/rpc/rpc.h:74:61: fatal=
 error: rpc/rpcb_clnt.h: No such file or directory</span></pre></div></bloc=
kquote></div><div class=3D"gmail_extra"><br></div></span>Have a failure on =
ARM then:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra"><a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-a=
rm/builds/85/steps/BuildImages/logs/stdio" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/main/builders/nightly-arm/builds/85/steps/BuildImage=
s/logs/stdio</a></div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Presumably you didn&#39;t do a build from a clean tmp, whereas t=
he autobuilder always does.=C2=A0 It&#39;s amazing how many missing build d=
ependencies this picks up, which is precisely why the autobuilder does it.<=
/div><span class=3D""><font color=3D"#888888"><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><div class=3D"gmail_extra"><br></div>after a lot of fing=
er-pointing and implying we don&#39;t test our changes or do our homework o=
r do clean builds:</div><div class=3D"gmail_extra">* I&#39;ve built ltp for=
 armv7a and armv8 on our builders and it works fine</div><div class=3D"gmai=
l_extra">* I&#39;ve built poky for x86 and it built fine<br><br>here&#39;s =
my steps:</div><div class=3D"gmail_extra">$ git clone git://<a href=3D"http=
://git.yoctoproject.org/poky">git.yoctoproject.org/poky</a></div><div class=
=3D"gmail_extra">$=C2=A0cd poky</div><div class=3D"gmail_extra">$=C2=A0sour=
ce oe-init-build-env</div><div class=3D"gmail_extra">$=C2=A0patch -p1 &lt; =
0001-ltp-update-to-20140828-release.patch</div><div class=3D"gmail_extra">$=
=C2=A0bitbake ltp</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra"><div class=3D"gmail_extra">$=C2=A0ls -l tmp/deploy/rpm/i586/ltp=
-*</div><div class=3D"gmail_extra">-rw-r--r-- 2 user=C2=A0user=C2=A05592960=
0 Nov =C2=A04 16:28 tmp/deploy/rpm/i586/ltp-20140828-r0.i586.rpm</div><div =
class=3D"gmail_extra">-rw-r--r-- 2=C2=A0user=C2=A0user=C2=A0=C2=A0 =C2=A0 3=
080 Nov =C2=A04 16:28 tmp/deploy/rpm/i586/ltp-dbg-20140828-r0.i586.rpm</div=
><div class=3D"gmail_extra">-rw-r--r-- 2=C2=A0user=C2=A0user=C2=A0=C2=A0 =
=C2=A0 3264 Nov =C2=A04 16:28 tmp/deploy/rpm/i586/ltp-dev-20140828-r0.i586.=
rpm</div><div class=3D"gmail_extra">-rw-r--r-- 2=C2=A0user=C2=A0user=C2=A0=
=C2=A0 =C2=A031884 Nov =C2=A04 16:28 tmp/deploy/rpm/i586/ltp-doc-20140828-r=
0.i586.rpm</div><div class=3D"gmail_extra"><br></div>afaict, the failure is=
n&#39;t related to the changes submitted. Could you be kind enough to try t=
o reproduce the build failure outside of the yocto autobuilders? or give me=
 the exact steps to reproduce the failure?<br><br>Cheers,</div><div class=
=3D"gmail_extra">Fathi<br clear=3D"all"><div><br></div>
</div></div>

--001a11c36daaee78f4050709dc95--
