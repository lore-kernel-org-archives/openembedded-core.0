Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.65])
 by mx.groups.io with SMTP id smtpd.web12.13621.1594620211972786606
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2020 23:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n+xfx2S4;
 spf=pass (domain: windriver.com, ip: 40.107.237.65, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDrw/7MBVTr6QPPHO5llGcjVnmmr7quDLDvTl3dV5uE9q5bStg6YnwRLWZswKMvPVxSPkJ/OqPDn58ZsKRJgcN9C581IvXCwzHWT6Yami85G4C4He0rf+OUxEfGzACNgoLtSERxZDlnvHikiHhSRh+z/dS0OS0U9Zx+VCo/eHioPjLDAKnR91wzRkF9rdoXyCUwlkZhV1Iu0B+WiImEFjI+7mC8P+VdMiEiDKitrxz/QOFJIZf+1S41D8C3hf2R46ywv2mwqjjJpvtK6UGXXYzyk5r/EhSeE+9YVzmv1bSHISl6xQrbr0KHMwlZoom63luf4dpgGA6C6rNTSjshkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H0s2Csd3FwYP5+vUT4Uy2/8UpRTqOYNmKFf4l3oh6A=;
 b=Nfy+ZyzruSk1FTJW0v+XJPGeil3TtFAz1So2q+Zn1GqedUwTja17txrZe1nkFjKfCc90r+VoC5sXvnUTooJnTb08G+2M0WqZB/k2dBSEC3sSjHijBdehbuHPoMh9HtGuiTnWj6CRkF4Ox6zWOZdRMckfADgVJhcR58mSL18Wlmw1ehfSUHEzmvScArBsChhaN8D/LuliMavcfUsEmZ/RVWk8oC6Y7CtuDtrtlXO3j/58dfk/FH5dSRkiC8ROGMexmJgy7xm5zpenS4raOAq5JaZ0JOW3sdpXeWNg/c6e2QvILjGQa0WpmCZGF+PhhTd2Z6Slc+fk/J2ns5KReasqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H0s2Csd3FwYP5+vUT4Uy2/8UpRTqOYNmKFf4l3oh6A=;
 b=n+xfx2S4zxiipIpcKAQx4q1ofi42aCfJ6dycGNfRF4roIkPSoon3YzUYcPCWHFVGusSPQgllrIATFCaGPiSLac2j9gHlrhhAuA6dkOsX+KwrfOzEQmsTnhk0tG2dURM4QwvmmGC5ufL0E56SX09Fz3pTcryBmaztacnOj1SsOJQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 06:03:29 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 06:03:29 +0000
Subject: Re: [OE-core] [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200630094907.1396284-1-changqing.li@windriver.com>
 <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org>
 <61ba6f0c-0bb3-42fa-408e-c2396d5a2773@windriver.com>
 <CA+chaQc3oXSrbDYdWKRyFEbqn9oNHdeiAVexmzVndwcyYFEBog@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <100548f6-240a-4ba1-0aeb-bc301d066c52@windriver.com>
Date: Mon, 13 Jul 2020 14:03:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CA+chaQc3oXSrbDYdWKRyFEbqn9oNHdeiAVexmzVndwcyYFEBog@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0165.apcprd02.prod.outlook.com
 (2603:1096:201:1f::25) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR02CA0165.apcprd02.prod.outlook.com (2603:1096:201:1f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Mon, 13 Jul 2020 06:03:28 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42fabbda-4cf0-4f02-8d97-08d826f27704
X-MS-TrafficTypeDiagnostic: SA0PR11MB4654:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4654BFA5D360E2E7E5E5D57682600@SA0PR11MB4654.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dEVg+GN37LBZig27k4WMeHvUQwmA8bQxFEEXCEGN/+brs9Rize+b6dJC70UhVG7lV4bmB06CBspF6w77mVeJj9IXqM5Vr+LP9AA9jAvnBUMra3/wQnVr7MpSA8l4bFQSKgrvdrknar0H0NabCHsT42OitXQP7HN0C0cTd7OqccEuf1m1oqoZGobebLtcTdYN99zZ7kof3eagO9hRsH2QtMMo7JqgRO0XjBIJ+14FTQAYazorHuSVp8riRGTjt+jxZpjC4mrFJvkWomeMInwGbFBgiS4zbRGmLWs+FpDPWDEL1FNwqc0BRK5caL67Nh20Dcb3FnL3UYfl2AV3P6fqxEpx6IiE8aVxuSQKKxMtUEheJmSN+LpDo2hH3/MYVT02hJJ5SFG2c2MxpOvOjC5vkDwtu8IW8zpvACx8GA+5fJEINJiqSuF0Oi49xXuwxkmeLYUE5b1dhm0n125SvwC8TYMPvPTCV+20I6M3LGFuHnaOTwKWV3hA1uAgn0CNu+R+kkgp552by9ScexTOVEmisQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39840400004)(376002)(136003)(346002)(396003)(30864003)(966005)(86362001)(83380400001)(5660300002)(6706004)(8936002)(15650500001)(36756003)(478600001)(31696002)(2616005)(316002)(52116002)(16576012)(8676002)(6666004)(956004)(6916009)(44832011)(6486002)(33964004)(2906002)(31686004)(4326008)(186003)(54906003)(26005)(166002)(66476007)(66946007)(53546011)(83080400001)(66556008)(16526019)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	DBllYvZe+cWU8ed/JpZhnNmohtbjAJRrqgxbhaweTZIftIZPLLYVu7dNqizHXQ4t2Rro5rEx6oHyIdneno5HzCslYSz7vsqtPIVYARQRtt2BpTapZc2jtck3SM7Mz07PuyAELCQhHv33lOqv1NOha0+VU6ZhX6bDh19UqmEAzPjIDLYbO3gnj7QiefnPkuc2/BNpDyWcCpCfEXFdNO1TlC1nu8YiEuve9G0+pEmwRuCqHxtRKI/RMAwLR7JCdV1znzlvy+4CC99ir92Hgm4fp1ZOWkS6hFpHsw6p89s58druYTxH1VKpFtH9v8r7QifilMU0R+NCKqfFWAhFKcZd3SNBq0YekflMCKcpIGR1KaQMH0uzsPiY5bELmfGP/3nRbY2xF/eYcn25kOXxjjbODL+fM9oI579roVT7AHKXlkKdhOlLuh6zUeNWFkg2SsdBBqFwMo6gkJCS7BzYxQUt4b6MoFWUmWJCyeQjqNESFoI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fabbda-4cf0-4f02-8d97-08d826f27704
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 06:03:29.6311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xdnsnw6n+ETzEMlosgzNOcjUkJqv21Ae4UACnTGBCbrsaMCOEF59gOboRP8jJeC+iMhyBoZxjavGPo4XgsEV/zZBt/CfZ8QH3/mzYlWzAv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
Content-Type: multipart/alternative;
 boundary="------------4B6D23F25AA1FFCA60EF35B1"
Content-Language: en-US

--------------4B6D23F25AA1FFCA60EF35B1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Martin

Thanks for tell me the problem.  Maybe I don't understand you 
correctly,  but I don't met your problem, below is what I tried,

if I am wrong, please tell me how I can reproduce your problem, thanks.


Here is what I tried:

bitbake adwaita-icon-themewithout my patch, and then build 
adwaita-icon-theme with my patch, and then run below command:

bitbake-diffsigs 
3.36.1-r0.do_prepare_recipe_sysroot.sigdata.608eb6ea5873c19534fddfeacee59d81fa799ce6c965217ffe76a0141885093a 
3.36.1-r0.do_prepare_recipe_sysroot.sigdata.b10948f26bfd089980c9f9af928e108e9764627201dcfd9db43efc8a455b181b
NOTE: Starting bitbake server...
runtaskdeps changed:
['autoconf/autoconf_2.69.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb 
automake/automake_1.16.2.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/automake/automake_1.16.2.bb', 
+gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot, 
'gnome/adwaita-icon-theme_3.36.1.bb:do_fetch 
gnu-config/gnu-config_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb', 
+gtk+/gtk+3_3.24.21.bb:do_populate_sysroot, 
'gtk+/gtk+3_3.24.21.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.21.bb 
hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot 
librsvg/librsvg_2.40.20.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb 
libtool/libtool-native_2.4.6.bb:do_populate_sysroot 
pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb 
pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pseudo/pseudo_git.bb']
Number of task dependencies changed
Dependency on task gtk+/gtk+3_3.24.21.bb:do_populate_sysroot was added 
with hash 60018dc07fa11c46226232c0923871b65f88f51a0b7665045f779a1111c1e1dd
Dependency on task gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot 
was added with hash 
17cd8a1fe76fa0b342dc50b8e2d71d8d88eec93d0367ae48629ae66f41eca11f


On 7/11/20 12:37 AM, Martin Jansa wrote:
> With this change now in master and dunfell there is signature issue in 
> allarch adwaita-icon-theme now runtime depending on TUNE_PKGARCH 
> gdk-pixbuf as shown by sstate-diff-machines.sh/bitbake-diffsigs 
> <http://sstate-diff-machines.sh/bitbake-diffsigs>:
>
> bitbake-diffsigs 
> tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-linux/adwaita-icon-theme/*do_prepare_recipe_sysroot*
> NOTE: Starting bitbake server...
> NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP: 
> 127.0.0.1, PORT: 33511, PID: 36423
> Hash for dependent task 
> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from 
> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to 
> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
> Unable to find matching sigdata for 
> openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot 
> with hashes 
> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 or 
> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
>
> On Wed, Jul 1, 2020 at 3:39 AM Changqing Li 
> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote:
>
>
>     On 6/30/20 6:01 PM, Richard Purdie wrote:
>     > On Tue, 2020-06-30 at 17:49 +0800, Changqing Li wrote:
>     >> From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     >>
>     >> fix error:
>     >> + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
>     >> /var/tmp/rpm-tmp.mdYxY6: line 12:
>     /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-
>     >> query-loaders: No such file or directory
>     >> %post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 2961
>     >> status 7f00
>     >> warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet
>     >> failed, exit status 127
>     >>
>     >> when install adwaita-icon-theme, which inherit gtk-icon-cache
>     >> on target, above error reported,  fix by add needeed packages
>     >> in RDEPENDS
>     >>
>     >> Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     >> ---
>     >>   meta/classes/gtk-icon-cache.bbclass | 2 ++
>     >>   1 file changed, 2 insertions(+)
>     >>
>     >> diff --git a/meta/classes/gtk-icon-cache.bbclass
>     b/meta/classes/gtk-
>     >> icon-cache.bbclass
>     >> index 91cb4ad409..7f218ce7ae 100644
>     >> --- a/meta/classes/gtk-icon-cache.bbclass
>     >> +++ b/meta/classes/gtk-icon-cache.bbclass
>     >> @@ -4,6 +4,8 @@ DEPENDS +=" ${@['hicolor-icon-theme',
>     '']['${BPN}' ==
>     >> 'hicolor-icon-theme']} gtk
>     >>
>     >>   PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
>     >>
>     >> +RDEPENDS_${PN} += "gdk-pixbuf gtk+3"
>     >> +
>     >>   gtk_icon_cache_postinst() {
>     >>   if [ "x$D" != "x" ]; then
>     >>      $INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG}
>     >> \
>     > This isn't quite right since the postinst may be added to a package
>     > other than ${PN}.
>     >
>     > You need to add the RDEPENDS to the code:
>     >
>     >          rdepends = ' ' + d.getVar('MLPREFIX', False) +
>     "hicolor-icon-theme"
>     >          d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>     >
>     > later in that class.
>     >
>     > Cheers,
>     >
>     > Richard
>     Thanks, I will correct it.
>     >
>     
>

--------------4B6D23F25AA1FFCA60EF35B1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi, Martin</p>
    <p>Thanks for tell me the problem.&nbsp; Maybe I don't understand you
      correctly,&nbsp; but I don't met your problem, below is what I tried,</p>
    <p>if I am wrong, please tell me how I can reproduce your problem,
      thanks.</p>
    <p><br>
    </p>
    <p>Here is what I tried:</p>
    <p>bitbake adwaita-icon-themewithout my patch, and then build
      adwaita-icon-theme with my patch, and then run below command:<br>
    </p>
    <p>bitbake-diffsigs
3.36.1-r0.do_prepare_recipe_sysroot.sigdata.608eb6ea5873c19534fddfeacee59d81fa799ce6c965217ffe76a0141885093a
3.36.1-r0.do_prepare_recipe_sysroot.sigdata.b10948f26bfd089980c9f9af928e108e9764627201dcfd9db43efc8a455b181b<br>
      NOTE: Starting bitbake server...<br>
      runtaskdeps changed:<br>
['autoconf/autoconf_2.69.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb
automake/automake_1.16.2.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/automake/automake_1.16.2.bb',
      &#43;gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot,
      'gnome/adwaita-icon-theme_3.36.1.bb:do_fetch
gnu-config/gnu-config_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb',
      &#43;gtk&#43;/gtk&#43;3_3.24.21.bb:do_populate_sysroot,
'gtk&#43;/gtk&#43;3_3.24.21.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/gtk&#43;/gtk&#43;3_3.24.21.bb
      hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot
librsvg/librsvg_2.40.20.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
      libtool/libtool-native_2.4.6.bb:do_populate_sysroot
pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pseudo/pseudo_git.bb']<br>
      Number of task dependencies changed<br>
      Dependency on task gtk&#43;/gtk&#43;3_3.24.21.bb:do_populate_sysroot was
      added with hash
      60018dc07fa11c46226232c0923871b65f88f51a0b7665045f779a1111c1e1dd<br>
      Dependency on task
      gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot was added with
      hash
      17cd8a1fe76fa0b342dc50b8e2d71d8d88eec93d0367ae48629ae66f41eca11f</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/11/20 12:37 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA&#43;chaQc3oXSrbDYdWKRyFEbqn9oNHdeiAVexmzVndwcyYFEBog@mail.gmail.com">
      <div dir="ltr">With this change now in master and dunfell there is
        signature issue in allarch&nbsp;adwaita-icon-theme now runtime
        depending on TUNE_PKGARCH gdk-pixbuf as shown by <a href="http://sstate-diff-machines.sh/bitbake-diffsigs" moz-do-not-send="true">sstate-diff-machines.sh/bitbake-diffsigs</a>:
        <div><br>
        </div>
        <div>bitbake-diffsigs
tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-linux/adwaita-icon-theme/*do_prepare_recipe_sysroot*<br>
          NOTE: Starting bitbake server...<br>
          NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP:
          127.0.0.1, PORT: 33511, PID: 36423<br>
          Hash for dependent task
          gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed
          from
          a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4
          to
          1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f<br>
          Unable to find matching sigdata for
openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot
          with hashes
          a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4
          or
          1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Jul 1, 2020 at 3:39 AM
          Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"><br>
          On 6/30/20 6:01 PM, Richard Purdie wrote:<br>
          &gt; On Tue, 2020-06-30 at 17:49 &#43;0800, Changqing Li wrote:<br>
          &gt;&gt; From: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
          &gt;&gt;<br>
          &gt;&gt; fix error:<br>
          &gt;&gt; &#43; /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
          --update-cache<br>
          &gt;&gt; /var/tmp/rpm-tmp.mdYxY6: line 12:
          /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-<br>
          &gt;&gt; query-loaders: No such file or directory<br>
          &gt;&gt; %post(adwaita-icon-theme-3.36.1-r0.0.noarch):
          waitpid(2961) rc 2961<br>
          &gt;&gt; status 7f00<br>
          &gt;&gt; warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch)
          scriptlet<br>
          &gt;&gt; failed, exit status 127<br>
          &gt;&gt;<br>
          &gt;&gt; when install adwaita-icon-theme, which inherit
          gtk-icon-cache<br>
          &gt;&gt; on target, above error reported,&nbsp; fix by add needeed
          packages<br>
          &gt;&gt; in RDEPENDS<br>
          &gt;&gt;<br>
          &gt;&gt; Signed-off-by: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
          &gt;&gt; ---<br>
          &gt;&gt;&nbsp; &nbsp;meta/classes/gtk-icon-cache.bbclass | 2 &#43;&#43;<br>
          &gt;&gt;&nbsp; &nbsp;1 file changed, 2 insertions(&#43;)<br>
          &gt;&gt;<br>
          &gt;&gt; diff --git a/meta/classes/gtk-icon-cache.bbclass
          b/meta/classes/gtk-<br>
          &gt;&gt; icon-cache.bbclass<br>
          &gt;&gt; index 91cb4ad409..7f218ce7ae 100644<br>
          &gt;&gt; --- a/meta/classes/gtk-icon-cache.bbclass<br>
          &gt;&gt; &#43;&#43;&#43; b/meta/classes/gtk-icon-cache.bbclass<br>
          &gt;&gt; @@ -4,6 &#43;4,8 @@ DEPENDS &#43;=&quot; ${@['hicolor-icon-theme',
          '']['${BPN}' ==<br>
          &gt;&gt; 'hicolor-icon-theme']} gtk<br>
          &gt;&gt;&nbsp; &nbsp;<br>
          &gt;&gt;&nbsp; &nbsp;PACKAGE_WRITE_DEPS &#43;= &quot;gtk&#43;3-native
          gdk-pixbuf-native&quot;<br>
          &gt;&gt;&nbsp; &nbsp;<br>
          &gt;&gt; &#43;RDEPENDS_${PN} &#43;= &quot;gdk-pixbuf gtk&#43;3&quot;<br>
          &gt;&gt; &#43;<br>
          &gt;&gt;&nbsp; &nbsp;gtk_icon_cache_postinst() {<br>
          &gt;&gt;&nbsp; &nbsp;if [ &quot;x$D&quot; != &quot;x&quot; ]; then<br>
          &gt;&gt;&nbsp; &nbsp; &nbsp; $INTERCEPT_DIR/postinst_intercept
          update_gtk_icon_cache ${PKG}<br>
          &gt;&gt; \<br>
          &gt; This isn't quite right since the postinst may be added to
          a package<br>
          &gt; other than ${PN}.<br>
          &gt;<br>
          &gt; You need to add the RDEPENDS to the code:<br>
          &gt;<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rdepends = ' ' &#43; d.getVar('MLPREFIX', False) &#43;
          &quot;hicolor-icon-theme&quot;<br>
          &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; d.appendVar('RDEPENDS_%s' % pkg, rdepends)<br>
          &gt;<br>
          &gt; later in that class.<br>
          &gt;<br>
          &gt; Cheers,<br>
          &gt;<br>
          &gt; Richard<br>
          Thanks, I will correct it.<br>
          &gt;<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------4B6D23F25AA1FFCA60EF35B1--
