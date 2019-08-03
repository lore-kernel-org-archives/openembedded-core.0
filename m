Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 766597F389
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 19:42:47 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l21so37697914pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 12:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=JqCmaMblaab2Ja6G0bLl91kW036y8QSjGN2WvTEOdmc=;
	b=DduptNK/vAomth79Nccap7guBW6ZsszeVEeqGxfOt+AaGphiEkcu/ngtv0gjAQ7PiH
	hGmwATdS/HjuM1B9zuLfTocNtB46uIMZLcFWT7AT1z0VCzN+Hfb5STh5pIEb/IZyM3IM
	S6N8NpzkQTGoyW9Y+3Zes0nYiV+yHmWWVHBHa+cI1yfNNjcrKTLWgVJiUNj9aFG/KEB9
	LeyHyBd1G5A7tKZZ/nrmcgRvG7sK1vmE/Lg1blhXUcWFkmkYQePD0vWtR5C798knwVzj
	vVUMcWVp9VkF3hO5ISGCuYD1KL6rZSC47s4Rjrke+d7ik62ZIXRtaz1/p70zT3Yl4HGm
	G2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=JqCmaMblaab2Ja6G0bLl91kW036y8QSjGN2WvTEOdmc=;
	b=c3Ors9oc92ocQEYZwPi1xMiR/Hy2QYYRzFxKzBsvPhBeMM+LVy+ekCatjz9B+OuV1y
	V6woPZnCGTA7zNpp1vRygig00gZTkgO4VnJzeoVv5ZkpK97xCcbsiF09OgpUS1nQOQcf
	YlNKUG2dzNzGXyshtddIUaZRuukS7Ly4ghYRWjj4j/bie/H9qEYRRAlTaBz8Ce+xKDNu
	otr281/z4e3CXKLWrAkE3mlWedRtVS2rIhwDcMenuEZ/nWQTFyk684Df0fNCPz12OPvQ
	aSaOKS3rINiGxyWlUzliJpMC73bvCJBrmmDTM8DkH02bXVASe5M91IXHDziUchYNBmFC
	MnBw==
X-Gm-Message-State: APjAAAWsFDgKq8pAygzyTYVnQKyF2hcip1WP60kSwLcQ8aI0Zgb2yScT
	VHWmg4XG5KhH1IyqnJ/zztQWzpV6BWY=
X-Google-Smtp-Source: APXvYqxCLMvuzu7+pFpCVpboRcXhRKQKNynvEBrqTUG8ZpikPU+pW4V+zY3A62s+i2V397i2acTEdQ==
X-Received: by 2002:a63:6c46:: with SMTP id
	h67mr122277645pgc.248.1564861367876; 
	Sat, 03 Aug 2019 12:42:47 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::d477? ([2601:646:8500:6bc6::d477])
	by smtp.gmail.com with ESMTPSA id
	f6sm81457808pga.50.2019.08.03.12.42.47
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Aug 2019 12:42:47 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190803183536.38590-1-raj.khem@gmail.com>
	<CANNYZj_Qp_c9ncMaAXKHaAjWHnqn3OG4YkNvvKHebh3viU5i=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <7d11f619-7227-866e-c018-e20f4d9f0b85@gmail.com>
Date: Sat, 3 Aug 2019 12:42:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_Qp_c9ncMaAXKHaAjWHnqn3OG4YkNvvKHebh3viU5i=w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa, llvm, meson: Update llvm to 8.0.1 plus define and use LLVM version globally
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
X-List-Received-Date: Sat, 03 Aug 2019 19:42:47 -0000
Content-Type: multipart/alternative;
	boundary="------------4EC4C55034B62C5FDD9007A0"
Content-Language: en-US

--------------4EC4C55034B62C5FDD9007A0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/3/19 11:54 AM, Alexander Kanavin wrote:
> On Sat, 3 Aug 2019 at 20:36, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
>     <http://llvm_git.bb> b/meta/recipes-devtools/llvm/llvm_git.bb
>     <http://llvm_git.bb>
>     index 0067635c2b..35ad3ced37 100644
>     --- a/meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>     +++ b/meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>     BRANCH = "release/${MAJOR_VERSION}.x"
>      MAJOR_VERSION = "8"
>      MINOR_VERSION = "0"
>     -PATCH_VERSION = "0"
>     +PATCH_VERSION = "1"
>      SOLIBVER = "1"
>      PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>      SRC_URI =
>     "git://github.com/llvm/llvm-project.git;branch=${BRANCH}
>     <http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D> \
>     "-Dgallium-xa=true, -Dgallium-xa=false"
>
>
> Should this bit also use LLVMVERSION?  It would be good to define the 
> llvm version in a single place, otherwise we will continue to trip 
> over partial mismatching updates. MAJOR_VERSION can be easily 
> determined via inline python.

it will limit the option of having another llvm recipe which could be 
provided by other layers for different reasons. so we provide a fallback 
implementation if someone wants to override they can.


>
> Alex

--------------4EC4C55034B62C5FDD9007A0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/19 11:54 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_Qp_c9ncMaAXKHaAjWHnqn3OG4YkNvvKHebh3viU5i=w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Sat, 3 Aug 2019 at 20:36, Khem Raj &lt;<a
            href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">diff --git
            a/meta/recipes-devtools/llvm/<a href="http://llvm_git.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a>
            b/meta/recipes-devtools/llvm/<a href="http://llvm_git.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a><br>
            index 0067635c2b..35ad3ced37 100644<br>
            --- a/meta/recipes-devtools/llvm/<a
              href="http://llvm_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">llvm_git.bb</a><br>
            +++ b/meta/recipes-devtools/llvm/<a
              href="http://llvm_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">llvm_git.bb</a><br>
             
            BRANCH = "release/${MAJOR_VERSION}.x"<br>
             MAJOR_VERSION = "8"<br>
             MINOR_VERSION = "0"<br>
            -PATCH_VERSION = "0"<br>
            +PATCH_VERSION = "1"<br>
             SOLIBVER = "1"<br>
             PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"<br>
             SRC_URI = "git://<a
              href="http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/llvm/llvm-project.git;branch=${BRANCH}</a>
            \<br>
             
            "-Dgallium-xa=true, -Dgallium-xa=false"<br>
          </blockquote>
          <div><br>
          </div>
          <div>Should this bit also use LLVMVERSION?  It would be good
            to define the llvm version in a single place, otherwise we
            will continue to trip over partial mismatching updates.
            MAJOR_VERSION can be easily determined via inline python.</div>
        </div>
      </div>
    </blockquote>
    <p>it will limit the option of having another llvm recipe which
      could be provided by other layers for different reasons. so we
      provide a fallback implementation if someone wants to override
      they can.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj_Qp_c9ncMaAXKHaAjWHnqn3OG4YkNvvKHebh3viU5i=w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------4EC4C55034B62C5FDD9007A0--
