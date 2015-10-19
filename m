Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CFD1373CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:51:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2015 09:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; 
	d="scan'208,217";a="814508350"
Received: from afshjern.zpn.intel.com (HELO [10.219.5.62]) ([10.219.5.62])
	by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2015 09:51:12 -0700
To: openembedded-core@lists.openembedded.org
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LaoQ4yp0AQtdKLQq22Nh=bgKgb4T8ApxyqxUc=U09FLkA@mail.gmail.com>
	<CAJTo0LZhMs6Pr85oq2H_Tut12yx_f1JEbM+nsWpVOf1UC98ABg@mail.gmail.com>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <56251FB1.4090700@linux.intel.com>
Date: Mon, 19 Oct 2015 11:52:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZhMs6Pr85oq2H_Tut12yx_f1JEbM+nsWpVOf1UC98ABg@mail.gmail.com>
Subject: Re: [PATCH 1/3] bitbake: add file-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 19 Oct 2015 16:51:13 -0000
Content-Type: multipart/alternative;
	boundary="------------040808020301080301070601"

--------------040808020301080301070601
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

#2 seems more ubiquitous

Franco

On 10/19/2015 11:11 AM, Burton, Ross wrote:
>
> On 19 October 2015 at 16:37, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     Not sure what to do here.  If we install file-native directly into
>     the sysroot we get occasional races on the file binary  causing
>     build failures.  If we make file-native ASSUME_PROVIDED then rpm
>     (and subversion) change their behaviour depending on the presence
>     of libmagic-dev on the host (well, rpm4 requires libmagic, rpm5
>     and subversion change their configuration).
>
>
> Two proposals:
>
> 1) Tell RPM and Subversion to explicitly enable libmagic support so
> they fail if libmagic-dev isn't installed on the host, and document
> that libmagic-dev is a build requirement
> 2) Change file-replacement-native to install libmagic, and add
> file-replacement-native as a dependency to subversion-native and
> rpm-native.
>
> Does anyone have a strong opinion either way?
>
> Ross
>
>


--------------040808020301080301070601
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    #2 seems more ubiquitous<br>
    <br>
    Franco<br>
    <br>
    <div class="moz-cite-prefix">On 10/19/2015 11:11 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZhMs6Pr85oq2H_Tut12yx_f1JEbM+nsWpVOf1UC98ABg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 October 2015 at 16:37, Burton,
            Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div>Not sure what to do here.  If we install file-native
                directly into the sysroot we get occasional races on the
                file binary  causing build failures.  If we make
                file-native ASSUME_PROVIDED then rpm (and subversion)
                change their behaviour depending on the presence of
                libmagic-dev on the host (well, rpm4 requires libmagic,
                rpm5 and subversion change their configuration).</div>
            </blockquote>
          </div>
          <br>
          Two proposals:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">1) Tell RPM and Subversion to
          explicitly enable libmagic support so they fail if
          libmagic-dev isn't installed on the host, and document that
          libmagic-dev is a build requirement</div>
        <div class="gmail_extra">2) Change file-replacement-native to
          install libmagic, and add file-replacement-native as a
          dependency to subversion-native and rpm-native.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Does anyone have a strong opinion
          either way?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------040808020301080301070601--
