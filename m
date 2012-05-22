Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1SWmD5-0005Fw-HI
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 12:20:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MAAlQV009858
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 03:10:50 -0700 (PDT)
Received: from [128.224.171.127] (128.224.171.127) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 22 May 2012 03:10:46 -0700
Message-ID: <4FBB6623.10607@windriver.com>
Date: Tue, 22 May 2012 13:10:43 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
	<CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
	<CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
	<CAPhnLPBSsP3acUN1uZvPDVCq6PzXF8mGGsFyvgdbfz6EuZ_RSA@mail.gmail.com>
	<CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
In-Reply-To: <CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 May 2012 10:20:59 -0000
Content-Type: multipart/alternative;
	boundary="------------080403010008040400060301"

--------------080403010008040400060301
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Same for me again on a try today:

> | build/tmp-eglibc-eglibc/sysroots/x86_64-linux/usr/bin/scc: line 399: 
> yocto/standard/beagleboard-standard: No such file or directory
> | ERROR. Could not find an excutable target for yocto/standard/base
> | ERROR. Could not locate meta series for yocto/standard/beagleboard
> | ERROR. Could not modify yocto/standard/base
> NOTE: package 
> linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: 
> task do_patch: Failed
Florin

On 05/22/2012 01:02 PM, Andrei Gherzan wrote:
> Even after using your workaround i can still reproduce this issue. 
> Yocto linux still fails.
>
> | ERROR. Could not find an excutable target for yocto/standard/base
> | ERROR. Could not locate meta series for yocto/standard/beagleboard
> | ERROR. Could not modify yocto/standard/base
> NOTE: package 
> linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: 
> task do_patch: Failed
> ERROR: Task 3 
> (/media/HDD/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.0.bb 
> <http://linux-yocto_3.0.bb>, do_patch) failed with exit code '1'
>
> On Thu, May 17, 2012 at 11:48 PM, Flanagan, Elizabeth 
> <elizabeth.flanagan@intel.com <mailto:elizabeth.flanagan@intel.com>> 
> wrote:
>
>     On Thu, May 17, 2012 at 7:59 AM, Andrei Gherzan <andrei@gherzan.ro
>     <mailto:andrei@gherzan.ro>> wrote:
>     > Today i just gave another try.... same result.
>
>     Responding here as well as the yocto list:
>
>     A few people have been having this issue and after some discussion we
>     think we have a root cause. Let me first explain what happened.
>
>     The autobuilder infrastructure shares a common DL_DIR in order to
>     optimize the builds and provide the source mirror. This DL_DIR is
>     rsynced to the publicaly available source mirror on a regular basis.
>     During our infrastructure upgrade the autobuilder attempted to pull
>     the tar archive for linux-yocto-3.0
>     (http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz)
>     but due to network issues related to our recent infrastructure upgrade
>     the file ended up as a 0 byte file. This file was rsynced the the
>     source mirror. A few days ago this was mentioned as an issue. Michael
>     Halstead corrected the network issue and I manually removed the file.
>     The autobuilder repulled the archive correctly and repopulated the
>     source mirror with it.
>
>     Things should have been ok at this point. However, we were still
>     getting reports of people sporadically running into a 0 byte file. Not
>     all the time, but some of the time. Michael Halstead and I just tailed
>     out the apache logs with Tom Zanussi wgetting the problematic file,
>     watching for failures. No failures were seen in the error logs however
>     Tom was still getting sporadic 0 byte files. Which means that his
>     request wasn't even hitting the server. I was not able to replicate
>     this. The only difference we could see is that I generally do not go
>     through a proxy whereas Tom was.
>
>     Our theory at this point is that all of the people who are hitting
>     this issue are going through a proxy and that their proxy setup has
>     cached that 0 byte file and refuses to regenerate it. There isn't a
>     lot we can do from our end about that other than suggest the following
>     work around. If you run into odd fetch issues with *just* the
>     linux-yocto-3.0 tar archive, clear out your DL_DIR of
>     git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz and set the
>     following:
>
>     PREMIRRORS ?= "\
>     bzr://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     cvs://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     git://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     hg://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     osc://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     p4://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     svk://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     svn://.*/.* http://autobuilder.yoctoproject.org/sources/ \n"
>
>     MIRRORS =+ "\
>     ftp://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     http://.*/.* http://autobuilder.yoctoproject.org/sources/ \n \
>     https://.*/.* http://autobuilder.yoctoproject.org/sources/ \n"
>
>     This will force the fetch to go to the autobuilder host of sources and
>     should work around any proxy caching issues. Then call your local IT
>     folks and ask them to clear out your proxy cache. If you run into any
>     fetch issues not related to this file, please let me know.
>
>     -b
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------080403010008040400060301
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Same for me again on a try today:<br>
    <br>
    <blockquote type="cite">|
      build/tmp-eglibc-eglibc/sysroots/x86_64-linux/usr/bin/scc: line
      399: yocto/standard/beagleboard-standard: No such file or
      directory<br>
      | ERROR. Could not find an excutable target for
      yocto/standard/base<br>
      | ERROR. Could not locate meta series for
      yocto/standard/beagleboard<br>
      | ERROR. Could not modify yocto/standard/base<br>
      NOTE: package
      linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
      task do_patch: Failed</blockquote>
    Florin<br>
    <br>
    On 05/22/2012 01:02 PM, Andrei Gherzan wrote:
    <blockquote
cite="mid:CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      Even after using your workaround i can still reproduce this issue.
      Yocto linux still fails.<br>
      <br>
      <div>| ERROR. Could not find an excutable target for
        yocto/standard/base</div>
      <div>| ERROR. Could not locate meta series for
        yocto/standard/beagleboard</div>
      <div>| ERROR. Could not modify yocto/standard/base</div>
      <div>
        NOTE: package
        linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
        task do_patch: Failed</div>
      <div>ERROR: Task 3
        (/media/HDD/yocto/poky/meta/recipes-kernel/linux/<a
          moz-do-not-send="true" href="http://linux-yocto_3.0.bb">linux-yocto_3.0.bb</a>,
        do_patch) failed with exit code '1'</div>
      <div><br>
      </div>
      <div>On Thu, May 17, 2012 at 11:48 PM, Flanagan, Elizabeth <span
          dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:elizabeth.flanagan@intel.com" target="_blank">elizabeth.flanagan@intel.com</a>&gt;</span>
        wrote:</div>
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, May
          17, 2012 at 7:59 AM, Andrei Gherzan &lt;<a
            moz-do-not-send="true" href="mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt;
          wrote:<br>
          &gt; Today i just gave another try.... same result.<br>
          <br>
          Responding here as well as the yocto list:<br>
          <br>
          A few people have been having this issue and after some
          discussion we<br>
          think we have a root cause. Let me first explain what
          happened.<br>
          <br>
          The autobuilder infrastructure shares a common DL_DIR in order
          to<br>
          optimize the builds and provide the source mirror. This DL_DIR
          is<br>
          rsynced to the publicaly available source mirror on a regular
          basis.<br>
          During our infrastructure upgrade the autobuilder attempted to
          pull<br>
          the tar archive for linux-yocto-3.0<br>
          (<a moz-do-not-send="true"
href="http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz"
            target="_blank">http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz</a>)<br>
          but due to network issues related to our recent infrastructure
          upgrade<br>
          the file ended up as a 0 byte file. This file was rsynced the
          the<br>
          source mirror. A few days ago this was mentioned as an issue.
          Michael<br>
          Halstead corrected the network issue and I manually removed
          the file.<br>
          The autobuilder repulled the archive correctly and repopulated
          the<br>
          source mirror with it.<br>
          <br>
          Things should have been ok at this point. However, we were
          still<br>
          getting reports of people sporadically running into a 0 byte
          file. Not<br>
          all the time, but some of the time. Michael Halstead and I
          just tailed<br>
          out the apache logs with Tom Zanussi wgetting the problematic
          file,<br>
          watching for failures. No failures were seen in the error logs
          however<br>
          Tom was still getting sporadic 0 byte files. Which means that
          his<br>
          request wasn't even hitting the server. I was not able to
          replicate<br>
          this. The only difference we could see is that I generally do
          not go<br>
          through a proxy whereas Tom was.<br>
          <br>
          Our theory at this point is that all of the people who are
          hitting<br>
          this issue are going through a proxy and that their proxy
          setup has<br>
          cached that 0 byte file and refuses to regenerate it. There
          isn't a<br>
          lot we can do from our end about that other than suggest the
          following<br>
          work around. If you run into odd fetch issues with *just* the<br>
          linux-yocto-3.0 tar archive, clear out your DL_DIR of<br>
          git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz and set the<br>
          following:<br>
          <br>
          PREMIRRORS ?= "\<br>
          bzr://.*/.* &nbsp; <a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          cvs://.*/.* &nbsp; <a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          git://.*/.* &nbsp; <a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          hg://.*/.* &nbsp; &nbsp;<a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          osc://.*/.* &nbsp; <a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          p4://.*/.* &nbsp; &nbsp;<a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          svk://.*/.* &nbsp; <a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          svn://.*/.* &nbsp; <a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n"<br>
          <br>
          MIRRORS =+ "\<br>
          <a class="moz-txt-link-freetext" href="ftp://.*/.*">ftp://.*/.*</a> &nbsp; &nbsp; &nbsp;<a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          <a class="moz-txt-link-freetext" href="http://.*/.*">http://.*/.*</a> &nbsp; &nbsp; <a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n \<br>
          <a class="moz-txt-link-freetext" href="https://.*/.*">https://.*/.*</a> &nbsp; &nbsp;<a moz-do-not-send="true"
            href="http://autobuilder.yoctoproject.org/sources/"
            target="_blank">http://autobuilder.yoctoproject.org/sources/</a>
          \n"<br>
          <br>
          This will force the fetch to go to the autobuilder host of
          sources and<br>
          should work around any proxy caching issues. Then call your
          local IT<br>
          folks and ask them to clear out your proxy cache. If you run
          into any<br>
          fetch issues not related to this file, please let me know.<br>
          <br>
          -b<br>
          <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a moz-do-not-send="true"
            href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
          <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
            target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
      <br>
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

--------------080403010008040400060301--
