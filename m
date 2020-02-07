Return-Path: <scott.branden@broadcom.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0D6C60AE8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 23:28:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so754113wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 15:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=mnjX8yu7QYDzJTza6bK7AUxUCpY+0LX9IttKcocQS3o=;
	b=DXt3SccVjFZBMi3q8fkl4kSnp7bHX/bvntNbO6ZER+4zAo1CxQDzmBbXutRjSKJ3Gh
	2GGEx6z0MDWrlumoTiseGTKcwt4wIKE7vTLoAIaUZIs7xYnrhzuJKdc+wSM7S/H216Zj
	urNXQFR6jqsAD12NhfKFFwFD4XYKYZaF3YVBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=mnjX8yu7QYDzJTza6bK7AUxUCpY+0LX9IttKcocQS3o=;
	b=KlRcTNYTwbRn6xCEbYt3ux9k6SZwpta9Z0M0dDWU0cPRGRg+Mr2Sm0zDIbHxb49HJB
	N5Qs1AcL+vLMiZQsWdvKP/kBfq45M0JWtwct497t1GZcGLD1nxkbuKpS1DMqsvhItBq5
	T2kRJiH+xygMoccuiIzhVf2z+ToaXkBvcOgtza/E37Vmp9OM7gdFoAFX18ErgWU1Cm5h
	9XEDb2s55oWZNB1WsEXzFE30Mh28B0cWQShdaGGf29bfbhxwqIAE8VYi3KB4VAMzL5jS
	1GJ3q/D+I62A7LmKBFJXkD1UDh233wxc9NVDrSOVKN0nmAzKfHLz8Yk+9z9+/4ie52DJ
	uIkg==
X-Gm-Message-State: APjAAAV9gLmfmVV3JcxSDtVrR2agnPYNwbPB3U6MMvoVO+cOxQhK/v8f
	q+L7xv1T0/mTp7STm70xgExfykR1RHoJSXvVmOorCl4oH6P90fYCAx68pXusH8abmXoMHeujNw1
	Yc0d1+6VKWORqhEA2wTPxr2tBipLiq4R0m73fB/9GX8U13t9KBsEVifsgGzl5EaR3O3dnvYAN9M
	TGtu6KQivKxRTv0sZAMvViEzXX
X-Google-Smtp-Source: APXvYqydJ0n+tlIF+NnixUUxrB1LVUyB+NLdbwBpiMpvoabykv8kF6Qgz9HKK1L8hgvtPbgm73ARAg==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr1443987wrn.128.1581118104692; 
	Fri, 07 Feb 2020 15:28:24 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	o187sm5775965wme.36.2020.02.07.15.28.23
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Feb 2020 15:28:24 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200207213440.10462-1-scott.branden@broadcom.com>
	<CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com>
	<073d103e-a32e-ff07-1223-220f9f97dcec@broadcom.com>
Message-ID: <065b0daf-ec38-b518-c1ab-195b514e5054@broadcom.com>
Date: Fri, 7 Feb 2020 15:28:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <073d103e-a32e-ff07-1223-220f9f97dcec@broadcom.com>
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
X-List-Received-Date: Fri, 07 Feb 2020 23:28:25 -0000
Content-Type: multipart/alternative;
	boundary="------------FECD6D5036E0EA96520E5318"
Content-Language: en-US

--------------FECD6D5036E0EA96520E5318
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex,

more comment below about PV.

On 2020-02-07 2:26 p.m., Scott Branden wrote:
> HI Alex,
>
> On 2020-02-07 2:09 p.m., Alexander Kanavin wrote:
>> Can you also enable x265 in ffmpeg and gstreamer plugins recipes, so 
>> there would be actual users of the codec in oe-core?
> I do have a patch for ffmpeg and have tested that works.  I'll add 
> that to the patch series.
>>
>> Also, x265 git repo does have tagged releases, and so PV/SRCREV in 
>> recipe should be set to match a release tag.
> You'll have to help me out a little here on exactly what you want.
>
> This is based off the stable tag.
> I already specified the SRCREV in the recipe.
>
> Do you want PV to be:
> PV = "stable+git${SRCPV}"
>
> ?
I was trying to follow the x264 recipe.

Do you want me do something like name the recipe x265_stable.bb instead 
and not specify PV?
>>
>> Alex
>>
>> On Fri, 7 Feb 2020 at 22:35, Scott Branden via Openembedded-core 
>> <openembedded-core@lists.openembedded.org 
>> <mailto:openembedded-core@lists.openembedded.org>> wrote:
>>
>>     Add x265 recipe from latest revision of stable branch.
>>
>>     Signed-off-by: Scott Branden <scott.branden@broadcom.com
>>     <mailto:scott.branden@broadcom.com>>
>>     ---
>>      meta/recipes-multimedia/x265/x265_git.bb <http://x265_git.bb> |
>>     21 +++++++++++++++++++++
>>      1 file changed, 21 insertions(+)
>>      create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>     <http://x265_git.bb>
>>
>>     diff --git a/meta/recipes-multimedia/x265/x265_git.bb
>>     <http://x265_git.bb> b/meta/recipes-multimedia/x265/x265_git.bb
>>     <http://x265_git.bb>
>>     new file mode 100644
>>     index 0000000000..7c230e2b1e
>>     --- /dev/null
>>     +++ b/meta/recipes-multimedia/x265/x265_git.bb <http://x265_git.bb>
>>     @@ -0,0 +1,21 @@
>>     +SUMMARY = "H.265/HEVC video encoder"
>>     +DESCRIPTION = "A free software library and application for
>>     encoding video streams into the H.265/HEVC format."
>>     +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>>     +
>>     +LICENSE = "GPLv2"
>>     +LICENSE_FLAGS = "commercial"
>>     +LIC_FILES_CHKSUM =
>>     "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>>     +
>>     +DEPENDS = "nasm-native"
>>     +DEPENDS = "gnutls zlib libpcre"
>>     +
>>     +SRC_URI = "git://github.com/videolan/x265;branch=stable
>>     <http://github.com/videolan/x265;branch=stable> \
>>     +          "
>>     +
>>     +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>>     +
>>     +S = "${WORKDIR}/git/source"
>>     +
>>     +inherit lib_package pkgconfig cmake
>>     +
>>     +AS[unexport] = "1"
>>     -- 
>>     2.17.1
>>
>>     -- 
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>


--------------FECD6D5036E0EA96520E5318
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Alex,<br>
    <br>
    more comment below about PV.<br>
    <br>
    <div class="moz-cite-prefix">On 2020-02-07 2:26 p.m., Scott Branden
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:073d103e-a32e-ff07-1223-220f9f97dcec@broadcom.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      HI Alex,<br>
      <br>
      <div class="moz-cite-prefix">On 2020-02-07 2:09 p.m., Alexander
        Kanavin wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com">
        <meta http-equiv="content-type" content="text/html;
          charset=UTF-8">
        <div dir="ltr">
          <div>Can you also enable x265 in ffmpeg and gstreamer plugins
            recipes, so there would be actual users of the codec in
            oe-core?</div>
        </div>
      </blockquote>
      I do have a patch for ffmpeg and have tested that works.  I'll add
      that to the patch series.<br>
      <blockquote type="cite"
cite="mid:CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com">
        <div dir="ltr">
          <div><br>
          </div>
          <div>Also, x265 git repo does have tagged releases, and so
            PV/SRCREV in recipe should be set to match a release tag.<br>
          </div>
        </div>
      </blockquote>
      You'll have to help me out a little here on exactly what you
      want.  <br>
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
    Do you want me do something like name the recipe x265_stable.bb
    instead and not specify PV?<br>
    <blockquote type="cite"
      cite="mid:073d103e-a32e-ff07-1223-220f9f97dcec@broadcom.com">
      <blockquote type="cite"
cite="mid:CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com">
        <div dir="ltr">
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, 7 Feb 2020 at 22:35,
            Scott Branden via Openembedded-core &lt;<a
              href="mailto:openembedded-core@lists.openembedded.org"
              moz-do-not-send="true">openembedded-core@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Add x265 recipe from
            latest revision of stable branch.<br>
            <br>
            Signed-off-by: Scott Branden &lt;<a
              href="mailto:scott.branden@broadcom.com" target="_blank"
              moz-do-not-send="true">scott.branden@broadcom.com</a>&gt;<br>
            ---<br>
             meta/recipes-multimedia/x265/<a href="http://x265_git.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">x265_git.bb</a>
            | 21 +++++++++++++++++++++<br>
             1 file changed, 21 insertions(+)<br>
             create mode 100644 meta/recipes-multimedia/x265/<a
              href="http://x265_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">x265_git.bb</a><br>
            <br>
            diff --git a/meta/recipes-multimedia/x265/<a
              href="http://x265_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">x265_git.bb</a>
            b/meta/recipes-multimedia/x265/<a href="http://x265_git.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">x265_git.bb</a><br>
            new file mode 100644<br>
            index 0000000000..7c230e2b1e<br>
            --- /dev/null<br>
            +++ b/meta/recipes-multimedia/x265/<a
              href="http://x265_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">x265_git.bb</a><br>
            @@ -0,0 +1,21 @@<br>
            +SUMMARY = "H.265/HEVC video encoder"<br>
            +DESCRIPTION = "A free software library and application for
            encoding video streams into the H.265/HEVC format."<br>
            +HOMEPAGE = "<a
              href="http://www.videolan.org/developers/x265.html"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://www.videolan.org/developers/x265.html</a>"<br>
            +<br>
            +LICENSE = "GPLv2"<br>
            +LICENSE_FLAGS = "commercial"<br>
            +LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E"
              href="file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
              moz-do-not-send="true">"file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"</a><br>
            +<br>
            +DEPENDS = "nasm-native"<br>
            +DEPENDS = "gnutls zlib libpcre"<br>
            +<br>
            +SRC_URI = "git://<a
              href="http://github.com/videolan/x265;branch=stable"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/videolan/x265;branch=stable</a>
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
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------FECD6D5036E0EA96520E5318--
