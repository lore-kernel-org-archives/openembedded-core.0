Return-Path: <scott.branden@broadcom.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 73FD760F6C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 19:16:59 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g6so1914468plt.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 11:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=HJ5ML4p4isJe6tsqL3y9LSrmjym4xOj/u0cO3GT3iQk=;
	b=dvT7F1yTpHDGPNg9u/JMIFdpXREXgcNvWgAjALuW7hODmchvcmhKOWfcSOtaAwvVx/
	SbXJqOX5Y4Nw9kEexFf6yFbh4Z8O9OshaDEyyZ2xpSUJhkXQq3tH8S+QXdT4xMkGBAYx
	/NHAU1qqcxPEuCdbQRyx/aRrmmPOfUs/9FrYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=HJ5ML4p4isJe6tsqL3y9LSrmjym4xOj/u0cO3GT3iQk=;
	b=INqnm4w/LpOqOtQXKrzjB0mQp2iCua+NqxSJ+DHSCvR6OkqaJIeFd1VXgCoYG2qLmw
	qqpyOqR92qwudlWr2SwiLSFehBp3G+sEnnivAFQIfXm4QY/mu7mNtRDyoZ3HrrDgVKXu
	t6Bwagy56rc83T3xOAl2SwxsPsvR/JS/IIe2gYa6MsiVlj8l6uRJrmlQxodu18blZ3/4
	7T8QX+Fw+ancoWSPDTC/ez+Q5ovWILXQojPypA8ajV+RLVqlzLAroNBnccFlQW4fFSQh
	B5yZD6WIX3CXx9pH+FerilYAG0TrTw/zvh8qsbvcq+zK++/kW/jbSF0hJ845/Ix9xn31
	BLHg==
X-Gm-Message-State: APjAAAWtcX1HU9sM4Fc7a/sqW4NM+xCWIxKDl07yri7CLgX+o1ooC+WL
	VsreszWEqEVauMfk9oDPKKeAKiYx2ORl6adzQloLSMfH/uc28y1/u1UnV/veC4++C8IS30nofia
	GXQgb9a48Gdi5v3aVn9WOkX1Zz8Yuo9Yno0nPtiqDpJlZs4kqwNOER6pY6oFvNQ10DwN54o7Kee
	HBQEMRAXMyNENsk0XwqHXNwt88Ryw=
X-Google-Smtp-Source: APXvYqwtebucPPPG6MZeg/wmej6dXpmyWUb1KXm94Nz+R1xm+eNBr5XQBRp62bfemBtJzK7QXexYog==
X-Received: by 2002:a17:90a:6545:: with SMTP id
	f5mr16928685pjs.42.1581275820088; 
	Sun, 09 Feb 2020 11:17:00 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	d64sm9890337pga.17.2020.02.09.11.16.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 09 Feb 2020 11:16:59 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200207213440.10462-1-scott.branden@broadcom.com>
	<CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com>
	<073d103e-a32e-ff07-1223-220f9f97dcec@broadcom.com>
	<065b0daf-ec38-b518-c1ab-195b514e5054@broadcom.com>
	<CANNYZj_WspzruDbxjnz8bNJYQhdQcgz8TocD2vACpFO7s-vfeQ@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <f12414c0-84f5-3600-fa8a-09f541fd840c@broadcom.com>
Date: Sun, 9 Feb 2020 11:16:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_WspzruDbxjnz8bNJYQhdQcgz8TocD2vACpFO7s-vfeQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x265: add x265 recipe
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
X-List-Received-Date: Sun, 09 Feb 2020 19:16:59 -0000
Content-Type: multipart/alternative;
	boundary="------------FF8E901099FAFD3CCC4E4593"
Content-Language: en-US

--------------FF8E901099FAFD3CCC4E4593
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex,

Thanks for the pointers.

Yes, too bad - the github mirror is out of date, it would be nice to 
have commit history.

I will setup x265_3.2.1.bb recipe use tarballs to fetch.


On 2020-02-08 6:47 a.m., Alexander Kanavin wrote:
> What I meant is that upstream is actually tagging releases:
> https://github.com/videolan/x265/releases
> and therefore we should package the latest release, rather than a 
> random commit.
>
> Which means you should name the recipe x265_3.1.2.bb 
> <http://x265_3.1.2.bb> and set SRCREV to match the 3.1.2 tag. Going 
> forward, the recipe should be updated the same way: rename file to the 
> new version, update SRCREV.
>
> Another problem is that github is not synced properly with the 
> original x265 repo, and is several months behind. SRC_URI should 
> probably refer to https://bitbucket.org/multicoreware/x265/src/default/
> Alternatively, don't use git at all and fetch tarballs: 
> http://ftp.videolan.org/pub/videolan/x265/
>
> Alex
>
> On Sat, 8 Feb 2020 at 00:28, Scott Branden <scott.branden@broadcom.com 
> <mailto:scott.branden@broadcom.com>> wrote:
>
>     Hi Alex,
>
>     more comment below about PV.
>
>     On 2020-02-07 2:26 p.m., Scott Branden wrote:
>>     HI Alex,
>>
>>     On 2020-02-07 2:09 p.m., Alexander Kanavin wrote:
>>>     Can you also enable x265 in ffmpeg and gstreamer plugins
>>>     recipes, so there would be actual users of the codec in oe-core?
>>     I do have a patch for ffmpeg and have tested that works. I'll add
>>     that to the patch series.
>>>
>>>     Also, x265 git repo does have tagged releases, and so PV/SRCREV
>>>     in recipe should be set to match a release tag.
>>     You'll have to help me out a little here on exactly what you want.
>>
>>     This is based off the stable tag.
>>     I already specified the SRCREV in the recipe.
>>
>>     Do you want PV to be:
>>     PV = "stable+git${SRCPV}"
>>
>>     ?
>     I was trying to follow the x264 recipe.
>
>     Do you want me do something like name the recipe x265_stable.bb
>     <http://x265_stable.bb> instead and not specify PV?
>>>
>>>     Alex
>>>
>>>     On Fri, 7 Feb 2020 at 22:35, Scott Branden via Openembedded-core
>>>     <openembedded-core@lists.openembedded.org
>>>     <mailto:openembedded-core@lists.openembedded.org>> wrote:
>>>
>>>         Add x265 recipe from latest revision of stable branch.
>>>
>>>         Signed-off-by: Scott Branden <scott.branden@broadcom.com
>>>         <mailto:scott.branden@broadcom.com>>
>>>         ---
>>>          meta/recipes-multimedia/x265/x265_git.bb
>>>         <http://x265_git.bb> | 21 +++++++++++++++++++++
>>>          1 file changed, 21 insertions(+)
>>>          create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>>         <http://x265_git.bb>
>>>
>>>         diff --git a/meta/recipes-multimedia/x265/x265_git.bb
>>>         <http://x265_git.bb>
>>>         b/meta/recipes-multimedia/x265/x265_git.bb <http://x265_git.bb>
>>>         new file mode 100644
>>>         index 0000000000..7c230e2b1e
>>>         --- /dev/null
>>>         +++ b/meta/recipes-multimedia/x265/x265_git.bb
>>>         <http://x265_git.bb>
>>>         @@ -0,0 +1,21 @@
>>>         +SUMMARY = "H.265/HEVC video encoder"
>>>         +DESCRIPTION = "A free software library and application for
>>>         encoding video streams into the H.265/HEVC format."
>>>         +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>>>         +
>>>         +LICENSE = "GPLv2"
>>>         +LICENSE_FLAGS = "commercial"
>>>         +LIC_FILES_CHKSUM =
>>>         "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>>>         +
>>>         +DEPENDS = "nasm-native"
>>>         +DEPENDS = "gnutls zlib libpcre"
>>>         +
>>>         +SRC_URI = "git://github.com/videolan/x265;branch=stable
>>>         <http://github.com/videolan/x265;branch=stable> \
>>>         +          "
>>>         +
>>>         +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>>>         +
>>>         +S = "${WORKDIR}/git/source"
>>>         +
>>>         +inherit lib_package pkgconfig cmake
>>>         +
>>>         +AS[unexport] = "1"
>>>         -- 
>>>         2.17.1
>>>
>>>         -- 
>>>         _______________________________________________
>>>         Openembedded-core mailing list
>>>         Openembedded-core@lists.openembedded.org
>>>         <mailto:Openembedded-core@lists.openembedded.org>
>>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>


--------------FF8E901099FAFD3CCC4E4593
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Alex,<br>
    <br>
    Thanks for the pointers.<br>
    <br>
    Yes, too bad - the github mirror is out of date, it would be nice to
    have commit history.<br>
    <br>
    I will setup x265_3.2.1.bb recipe use tarballs to fetch.<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2020-02-08 6:47 a.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_WspzruDbxjnz8bNJYQhdQcgz8TocD2vACpFO7s-vfeQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>What I meant is that upstream is actually tagging releases:</div>
        <div><a href="https://github.com/videolan/x265/releases"
            moz-do-not-send="true">https://github.com/videolan/x265/releases</a></div>
        <div>and therefore we should package the latest release, rather
          than a random commit. <br>
        </div>
        <div><br>
        </div>
        <div>Which means you should name the recipe <a
            href="http://x265_3.1.2.bb" moz-do-not-send="true">x265_3.1.2.bb</a>
          and set SRCREV to match the 3.1.2 tag. Going forward, the
          recipe should be updated the same way: rename file to the new
          version, update SRCREV.</div>
        <div><br>
        </div>
        <div>Another problem is that github is not synced properly with
          the original x265 repo, and is several months behind. SRC_URI
          should probably refer to <a
            href="https://bitbucket.org/multicoreware/x265/src/default/"
            moz-do-not-send="true">https://bitbucket.org/multicoreware/x265/src/default/</a></div>
        <div>Alternatively, don't use git at all and fetch tarballs: <a
            href="http://ftp.videolan.org/pub/videolan/x265/"
            moz-do-not-send="true">http://ftp.videolan.org/pub/videolan/x265/</a></div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Sat, 8 Feb 2020 at 00:28,
          Scott Branden &lt;<a href="mailto:scott.branden@broadcom.com"
            moz-do-not-send="true">scott.branden@broadcom.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div> Hi Alex,<br>
            <br>
            more comment below about PV.<br>
            <br>
            <div>On 2020-02-07 2:26 p.m., Scott Branden wrote:<br>
            </div>
            <blockquote type="cite"> HI Alex,<br>
              <br>
              <div>On 2020-02-07 2:09 p.m., Alexander Kanavin wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div>Can you also enable x265 in ffmpeg and gstreamer
                    plugins recipes, so there would be actual users of
                    the codec in oe-core?</div>
                </div>
              </blockquote>
              I do have a patch for ffmpeg and have tested that works. 
              I'll add that to the patch series.<br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div><br>
                  </div>
                  <div>Also, x265 git repo does have tagged releases,
                    and so PV/SRCREV in recipe should be set to match a
                    release tag.<br>
                  </div>
                </div>
              </blockquote>
              You'll have to help me out a little here on exactly what
              you want.  <br>
              <br>
              This is based off the stable tag.<br>
              I already specified the SRCREV in the recipe.<br>
              <br>
              Do you want PV to be:<br>
              PV = "stable+git${SRCPV}"<br>
              <br>
              ?<br>
            </blockquote>
            I was trying to follow the x264 recipe.<br>
            <br>
            Do you want me do something like name the recipe <a
              href="http://x265_stable.bb" target="_blank"
              moz-do-not-send="true">x265_stable.bb</a> instead and not
            specify PV?<br>
            <blockquote type="cite">
              <blockquote type="cite">
                <div dir="ltr">
                  <div><br>
                  </div>
                  <div>Alex<br>
                  </div>
                </div>
                <br>
                <div class="gmail_quote">
                  <div dir="ltr" class="gmail_attr">On Fri, 7 Feb 2020
                    at 22:35, Scott Branden via Openembedded-core &lt;<a
href="mailto:openembedded-core@lists.openembedded.org" target="_blank"
                      moz-do-not-send="true">openembedded-core@lists.openembedded.org</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class="gmail_quote" style="margin:0px 0px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">Add x265 recipe
                    from latest revision of stable branch.<br>
                    <br>
                    Signed-off-by: Scott Branden &lt;<a
                      href="mailto:scott.branden@broadcom.com"
                      target="_blank" moz-do-not-send="true">scott.branden@broadcom.com</a>&gt;<br>
                    ---<br>
                     meta/recipes-multimedia/x265/<a
                      href="http://x265_git.bb" rel="noreferrer"
                      target="_blank" moz-do-not-send="true">x265_git.bb</a>
                    | 21 +++++++++++++++++++++<br>
                     1 file changed, 21 insertions(+)<br>
                     create mode 100644 meta/recipes-multimedia/x265/<a
                      href="http://x265_git.bb" rel="noreferrer"
                      target="_blank" moz-do-not-send="true">x265_git.bb</a><br>
                    <br>
                    diff --git a/meta/recipes-multimedia/x265/<a
                      href="http://x265_git.bb" rel="noreferrer"
                      target="_blank" moz-do-not-send="true">x265_git.bb</a>
                    b/meta/recipes-multimedia/x265/<a
                      href="http://x265_git.bb" rel="noreferrer"
                      target="_blank" moz-do-not-send="true">x265_git.bb</a><br>
                    new file mode 100644<br>
                    index 0000000000..7c230e2b1e<br>
                    --- /dev/null<br>
                    +++ b/meta/recipes-multimedia/x265/<a
                      href="http://x265_git.bb" rel="noreferrer"
                      target="_blank" moz-do-not-send="true">x265_git.bb</a><br>
                    @@ -0,0 +1,21 @@<br>
                    +SUMMARY = "H.265/HEVC video encoder"<br>
                    +DESCRIPTION = "A free software library and
                    application for encoding video streams into the
                    H.265/HEVC format."<br>
                    +HOMEPAGE = "<a
                      href="http://www.videolan.org/developers/x265.html"
                      rel="noreferrer" target="_blank"
                      moz-do-not-send="true">http://www.videolan.org/developers/x265.html</a>"<br>
                    +<br>
                    +LICENSE = "GPLv2"<br>
                    +LICENSE_FLAGS = "commercial"<br>
                    +LIC_FILES_CHKSUM = <a moz-do-not-send="true">"file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"</a><br>
                    +<br>
                    +DEPENDS = "nasm-native"<br>
                    +DEPENDS = "gnutls zlib libpcre"<br>
                    +<br>
                    +SRC_URI = "git://<a
                      href="http://github.com/videolan/x265;branch=stable"
                      rel="noreferrer" target="_blank"
                      moz-do-not-send="true">github.com/videolan/x265;branch=stable</a>
                    \<br>
                    +          "<br>
                    +<br>
                    +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"<br>
                    +<br>
                    +S = "${WORKDIR}/git/source"<br>
                    +<br>
                    +inherit lib_package pkgconfig cmake<br>
                    +<br>
                    +AS[unexport] = "1"<br>
                    -- <br>
                    2.17.1<br>
                    <br>
                    -- <br>
                    _______________________________________________<br>
                    Openembedded-core mailing list<br>
                    <a
                      href="mailto:Openembedded-core@lists.openembedded.org"
                      target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                    <a
                      href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                      rel="noreferrer" target="_blank"
                      moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                  </blockquote>
                </div>
              </blockquote>
              <br>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------FF8E901099FAFD3CCC4E4593--
