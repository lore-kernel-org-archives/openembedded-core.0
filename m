Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1SUxqE-0006H8-Av
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 12:21:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4HABog9010962
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 03:11:50 -0700 (PDT)
Received: from [128.224.171.127] (128.224.171.127) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 May 2012 03:11:50 -0700
Message-ID: <4FB4CEE5.8070705@windriver.com>
Date: Thu, 17 May 2012 13:11:49 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
In-Reply-To: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 10:22:00 -0000
Content-Type: multipart/alternative;
	boundary="------------020709060000000202040508"

--------------020709060000000202040508
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I confirm I still encounter the same error.

On 05/17/2012 01:09 PM, Andrei Gherzan wrote:
> Today i ran into an issue that Florin Sarbu signaled sometime last 
> week. It seems like do_patch crashes while compiling linux 3.0:
>
>     ERROR: Logfile of failure stored in:
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
>     Log data follows:
>     | Branch meta-temp set up to track remote branch meta from origin.
>     | git reset --mixed 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc
>     | Deleted branch meta-temp (was 620917d).
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>     line 434: yocto/standard/beagleboard-standard.scc: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>     line 436: yocto/standard/beagleboard-standard.scc: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>     line 437: yocto/standard/beagleboard-standard.scc: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>     line 438: yocto/standard/beagleboard-standard.scc: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
>     line 441: yocto/standard/beagleboard-standard.scc: No such file or
>     directory
>     | readlink: missing operand
>     | Try `readlink --help' for more information.
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     | /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Function
>     failed: do_patch (see
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
>     for further information)
>     | p/sysroots/i686-linux/usr/bin/scc: line 399:
>     yocto/standard/beagleboard-standard: No such file or directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     |
>     /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
>     line 399: yocto/standard/beagleboard-standard: No such file or
>     directory
>     | ERROR. Could not find an excutable target for yocto/standard/base
>     | ERROR. Could not locate meta series for yocto/standard/beagleboard
>     | ERROR. Could not modify yocto/standard/base
>     NOTE: package
>     linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
>     task do_patch: Failed
>
> I didn't have time to understand were is the source of this problem 
> but i suspect that is a sever-sided issue as this was reproducible 
> yesterday even if i didn't change anything in layers.
>
> @g
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------020709060000000202040508
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I confirm I still encounter the same error.<br>
    <br>
    On 05/17/2012 01:09 PM, Andrei Gherzan wrote:
    <blockquote
cite="mid:CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      Today i ran into an issue that Florin Sarbu signaled sometime last
      week. It seems like do_patch crashes while compiling linux 3.0:
      <div><br>
      </div>
      <div>
        <blockquote style="margin:0 0 0 40px;border:none;padding:0px">
          <div>
            <div>
              ERROR: Logfile of failure stored in:
/media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864</div>
            <div>Log data follows:</div>
            <div>| Branch meta-temp set up to track remote branch meta
              from origin.</div>
            <div>| git reset --mixed
              620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc</div>
            <div>| Deleted branch meta-temp (was 620917d).</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
              line 434: yocto/standard/beagleboard-standard.scc: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
              line 436: yocto/standard/beagleboard-standard.scc: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
              line 437: yocto/standard/beagleboard-standard.scc: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
              line 438: yocto/standard/beagleboard-standard.scc: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
              line 441: yocto/standard/beagleboard-standard.scc: No such
              file or directory</div>
            <div>| readlink: missing operand</div>
            <div>
              | Try `readlink --help' for more information.</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR:
              Function failed: do_patch (see
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
              for further information)</div>
            <div>| p/sysroots/i686-linux/usr/bin/scc: line 399:
              yocto/standard/beagleboard-standard: No such file or
              directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>|
              /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
              line 399: yocto/standard/beagleboard-standard: No such
              file or directory</div>
            <div>| ERROR. Could not find an excutable target for
              yocto/standard/base</div>
            <div>| ERROR. Could not locate meta series for
              yocto/standard/beagleboard</div>
            <div>| ERROR. Could not modify yocto/standard/base</div>
            <div>NOTE: package
              linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
              task do_patch: Failed</div>
          </div>
          <div><br>
          </div>
        </blockquote>
        I didn't have time to understand were is the source of this
        problem but i suspect that is a sever-sided issue as this was
        reproducible yesterday even if i didn't change anything in
        layers.</div>
      <div><br>
      </div>
      <div>@g
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020709060000000202040508--
