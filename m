Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE5D601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 16:27:28 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id j10-v6so4416991oii.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Yr7UB6j/RkwEgckWdfeslXsPt31lGqYwYGbhqk3njps=;
	b=MRZv0VwiS1ii+rAIAvZB8ropgEObAeRvg+hJmHl6pMc4x9WA8m0BEso3v9538pt2Xh
	i+/psXe9UzwWu5DEPkb9kqfs1M+DNgS3NFPYN5SLYciYFFeAsLMUisuLy0hvR1z+wdzz
	JNiuM8l6b0wYMDOE3UXRdkjhqLaZjRNuGvQLjP0KJzKUR+HbNBb7TNGuRzzLH6nS/32l
	lpuH57irAHUvh08jUcqlJKX8+zjeJUX9AvPu/BjvTTNPLC8KTdgp2HiDY1nJmGZEDjPp
	WNyiJsX4N5Ffbzp5HQwmUdIkXWvt4/exKHH1vCIta4dJbSfT+d1Chey6AUM4y8XUlBwK
	19Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Yr7UB6j/RkwEgckWdfeslXsPt31lGqYwYGbhqk3njps=;
	b=Sa7pCFRqVvpTVuJZlCZsq6MRr38p5Y7i534TT9gf9LfhiQjisTGjaFC/ZMKSWLrAZS
	SDv1IdHfU1H5Gy1YD3RaTTnzeJ0+/vvLy38th6agdSAgQMT89ORr/gES8fBpmCnjsWEN
	g6WnHObxeU/Ms0lXhW1VUWHOaAYWotwDR8nxYv4OJ0m6nyhjqrSsGtqO+TxLrq7kgIP6
	XnCmSlehXafJaEfnQlb9wtmf1idH5qnGtO47joLN7tq/9Q2uodhc7WJRqmfVxCvCBA/r
	GATY38hjtR8hGVwMv3O9jHmo90lfc/lSdjjeBL8ZbF6ocQ7DmCZ34Jy+E6hdtrVOr6TC
	hVPA==
X-Gm-Message-State: ALQs6tBMv6fkCZVdKz8Zm4dekFEAjZzJnrw1daT9Jj+zlbkcAsdNTIBR
	r4AzFeW0xvBSdEf1mjm1GO4ToeZ9GUPGvBwVA5C7iA==
X-Google-Smtp-Source: AIpwx4/Lh+oV0JsiaKMAbTLXOP+05ao9ixma/a2ZUk8O7L23UisCf8S0cCKrzCwaG/dz++3qX5Bn9mTlsWSETDWVRqc=
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr1727409oig.102.1523982449789; 
	Tue, 17 Apr 2018 09:27:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 17 Apr 2018 09:27:08 -0700 (PDT)
In-Reply-To: <655290B7709079438B7932553958E60DA1475972@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
	<CY4PR02MB3334C4C5BD7719470CB91CA6ACB70@CY4PR02MB3334.namprd02.prod.outlook.com>
	<655290B7709079438B7932553958E60DA1475972@ESS-EX01.essvote.corp.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Apr 2018 17:27:08 +0100
Message-ID: <CAJTo0LZZkVyZEwGyffU8GkEev4a8U5eFAXWa_fAhRTBWYaKkqQ@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [sumo][python3] Generated SDK missing sqlite3
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
X-List-Received-Date: Tue, 17 Apr 2018 16:27:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Work for me with plain oe-core:

$ ./poky-glibc-x86_64-core-image-minimal-corei7-64-toolchain-ext-2.4+snapsh=
ot.sh
Poky (Yocto Project Reference Distro) Extensible SDK installer version
2.4+snapshot
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
Enter target directory for SDK (default: ~/poky_sdk):
You are about to install the SDK to "/home/ross/poky_sdk". Proceed[Y/n]? y
Extracting SDK.............................................................=
..........done
Setting it up...
Extracting buildtools...
Preparing build system...
Parsing recipes: 100%
|##########################################################################=
####|
Time: 0:00:10
Initialising tasks: 100%
|##########################################################################=
#|
Time: 0:00:07
Checking sstate mirror object availability: 100%
|###################################################| Time: 0:00:00
Loading cache: 100%
|##########################################################################=
######|
Time: 0:00:00
Initialising tasks: 100%
|##########################################################################=
#|
Time: 0:00:00
done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to
source the environment setup script e.g.
 $ . /home/ross/poky_sdk/environment-setup-corei7-64-poky-linux

Obviously something is different, how are you reproducing this?

Ross

On 17 April 2018 at 14:50, Davis, Michael <michael.davis@essvote.com> wrote=
:
> I was on the HEAD of sumo(commit d012a9acdc3dce014705224a1261145628e75931=
)
> so that commit was already included when I had the issue.  Just generated
> another test today and the issue was still there.  If I remove
> native-python3-misc from TOOLCHAIN_HOST_TASK it fails on installing the S=
DK.
> With it there it succeeds.
>
>
>
> Mike
>
>
>
>
>
>
>
> From: Alejandro Enedino Hernandez Samaniego [mailto:alejandr@xilinx.com]
> Sent: Monday, April 16, 2018 8:07 PM
> To: Davis, Michael; openembedded-core@lists.openembedded.org
> Subject: RE: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
>
>
>
> Which commit are you using?
>
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D4379b29e7eed=
e727993ee68c9eba2bdebace5108
>
>
>
> In any case, that one should=E2=80=99ve solved it.
>
>
>
> Alejandro
>
>
>
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Davis, Michael
> Sent: Monday, April 16, 2018 11:19 AM
> To: Davis, Michael <michael.davis@essvote.com>;
> openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [OE-CORE][sumo][python3] Generated SDK missing
> sqlite3
>
>
>
> Adding python3-misc to the SDK seems to have solved the issue.
>
> I saw some commits about separating the two so perhaps this is a side
> effect?
>
>
>
> From: Davis, Michael
> Sent: Monday, April 16, 2018 11:04 AM
> To: 'openembedded-core@lists.openembedded.org'
> Subject: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
>
>
>
> Testing out the upcoming sumo release and ran into an issue.  Whenever I
> attempt to generate an sdk-ext with sumo I get a failure about missing
> sqlite3.
>
> Traceback (most recent call last):
>  File "/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/devtoo=
l",
> line 344, in <module>
>    ret =3D main()
>  File "/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/devtoo=
l",
> line 285, in main
>    scriptutils.logger_setup_color(logger, global_args.color)
>  File "/home/mdavis/core_sdk/layers/core/scripts/lib/scriptutils.py", lin=
e
> 38, in logger_setup_color
>    from bb.msg import BBLogFormatter
>  File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/__init__.py", lin=
e
> 79, in <module>
>    from bb import fetch2 as fetch
>  File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/fetch2/__init__.p=
y",
> line 39, in <module>
>    import bb.persist_data, bb.utils
>  File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/persist_data.py",
> line 33, in <module>
>    sqlversion =3D sqlite3.sqlite_version_info
> AttributeError: module 'sqlite3' has no attribute 'sqlite_version_info'
>
>
>
> The issue seems to be isolated only to python3. The sdk partially install=
s
> and I am able to source it.  I created a small python sqlite app and was
> able to run it properly with python2, but not 3.
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

