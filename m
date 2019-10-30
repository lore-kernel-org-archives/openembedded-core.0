Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 946407F984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 04:29:53 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 15so562876pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=CD/P4/nSmQvnlYBhr1DiQJ2E1ukTke9pC5gqMu1pWP8=;
	b=IBKQ64Bf+C6cdWkmTxVygokL1R67vv70loe7hWWGr5jUoNWma6KarXHUFKeNdlRpK6
	UEXJ32AHjDGlvlPSvGYgqYwEJ1XkLjd2PQDgyuUZCfldlnzRZ6SOaLw5WYtoGkaFskXq
	M6pEClsgscxmi4cR9jGKldhVrGf2fcbYy0tZqQAujt2hqeiwzmWkuxJ0wx3l9RNJjN7g
	RhIucITP6z4rm7X+DHCPbixVhJYQEe61YBTisDzDW1LHQVKV5TFVUPcWqEVC62RPVNn0
	dF08HtGAMUvlWHQfZSI7X1uOgpvVLeO9v5vlvQaBeGPPj7/McLsm/52Z1uXu2Ps9B0R9
	3zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=CD/P4/nSmQvnlYBhr1DiQJ2E1ukTke9pC5gqMu1pWP8=;
	b=BKfQEpnjGTcMo6vXRXHgeqJdXYa/MxkXUEXayWEZPb+2ZDNLaTamEY7eWecfCaF89v
	73NXK5kCp8+Z2agIB+vMVUn39h9JVp3IZQECq+VAIsQ9Be28GezAf9/B5FqhIpJF5AFm
	XUmdIDMZTA0NwaRA2J/HFFDMEyU3znMLcYPeZbMW7eAswWZuL4hb1OzOIeXqmToDctoS
	KUXmDtSydXIDuSo/XBeP34wXsrxP0DHDTPBVOiI38vLH817wAT16Vh9FBwvT5eg4GaYx
	fFTMQCW0/pJSaONBiHEfQHh16GQsQ4lT2M0k20+q6b/ClFk4pcxpIXqcBiUyaMSnzsbs
	Iseg==
X-Gm-Message-State: APjAAAVTPah4hG7gLwIbS5VPMSIhuxPSK3eFEEJMSvxFMoJNWuRus5De
	29McYDiU1JkR59Q97ucKwN0/vMwe
X-Google-Smtp-Source: APXvYqyoAeOK1Bqto+VHes6PxuC10QeNIdIwvFdqPPmlcq+rJLONa5oKYtodMT67ItumDJpD6gnzZA==
X-Received: by 2002:a63:4809:: with SMTP id v9mr33070909pga.442.1572409794413; 
	Tue, 29 Oct 2019 21:29:54 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id x7sm774702pff.0.2019.10.29.21.29.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2019 21:29:53 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1572072421.git.akuster808@gmail.com>
	<beec8a52a8738b0a88cc81dc7898fa38b5088b68.1572072422.git.akuster808@gmail.com>
	<100fd9d42893f3ea7683fb70281d0622f1896259.camel@linuxfoundation.org>
	<CAMKF1so131wZ80vgLm3KRu9DnBa=P08B=eJFwSNUb-BpAYJbnw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5a0f6604-1517-4fb0-2a5c-6707bc9b68d5@gmail.com>
Date: Wed, 30 Oct 2019 05:29:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so131wZ80vgLm3KRu9DnBa=P08B=eJFwSNUb-BpAYJbnw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus 18/28] cmake.bbclass: add HOSTTOOLS_DIR to CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Wed, 30 Oct 2019 04:29:53 -0000
Content-Type: multipart/alternative;
	boundary="------------2C87C8552F31E031E9189DE4"
Content-Language: en-US

--------------2C87C8552F31E031E9189DE4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 10/29/19 9:31 PM, Khem Raj wrote:
>
>
> On Tue, Oct 29, 2019 at 9:19 AM Richard Purdie
> <richard.purdie@linuxfoundation.org
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Fri, 2019-10-25 at 23:49 -0700, Armin Kuster wrote:
>     > From: Michael Ho <Michael.Ho@bmw.de <mailto:Michael.Ho@bmw.de>>
>     >
>     > The find_program command will fail if it is used on a tool that is
>     > listed in
>     > ASSUME_PROVIDED. This is because these tools are in the hosttools
>     > directory
>     > which is not listed in CMAKE_FIND_ROOT_PATH so cmake will not find
>     > them.
>     >
>     > Adding the directory HOSTTOOLS_DIR to the CMAKE_FIND_ROOT_PATH
>     > variable fixes
>     > the initial issue of needing to search for tools in ASSUME_PROVIDED.
>     >
>     > Note that this change alone does not fix the issue because
>     > find_program will
>     > by default only look into the subdirectories bin and usr/bin under
>     > the paths
>     > in CMAKE_FIND_ROOT_PATH to find the programs and the hosttools
>     > directory has
>     > instead the symlinks directly present without these subdirectories.
>     >
>     > Set CMAKE_PROGRAM_PATH to by default include the root directory so
>     > find_program can search the hosttools directory without needing the
>     > prefix
>     > directories.
>     >
>     > Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     > (cherry picked from commit 7847f431cd8db59fce8c9401a603c4b0678ee16d)
>     > Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>
>     Given the fallout in meta-oe, I don't plan to take this.
>
>  
> +1

So is this why to took me on a 3 mile walk up a hill?


>
>
>     Cheers,
>
>     Richard
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------2C87C8552F31E031E9189DE4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/29/19 9:31 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1so131wZ80vgLm3KRu9DnBa=P08B=eJFwSNUb-BpAYJbnw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Oct 29, 2019 at 9:19
            AM Richard Purdie &lt;<a
              href="mailto:richard.purdie@linuxfoundation.org"
              moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri,
            2019-10-25 at 23:49 -0700, Armin Kuster wrote:<br>
            &gt; From: Michael Ho &lt;<a href="mailto:Michael.Ho@bmw.de"
              target="_blank" moz-do-not-send="true">Michael.Ho@bmw.de</a>&gt;<br>
            &gt; <br>
            &gt; The find_program command will fail if it is used on a
            tool that is<br>
            &gt; listed in<br>
            &gt; ASSUME_PROVIDED. This is because these tools are in the
            hosttools<br>
            &gt; directory<br>
            &gt; which is not listed in CMAKE_FIND_ROOT_PATH so cmake
            will not find<br>
            &gt; them.<br>
            &gt; <br>
            &gt; Adding the directory HOSTTOOLS_DIR to the
            CMAKE_FIND_ROOT_PATH<br>
            &gt; variable fixes<br>
            &gt; the initial issue of needing to search for tools in
            ASSUME_PROVIDED.<br>
            &gt; <br>
            &gt; Note that this change alone does not fix the issue
            because<br>
            &gt; find_program will<br>
            &gt; by default only look into the subdirectories bin and
            usr/bin under<br>
            &gt; the paths<br>
            &gt; in CMAKE_FIND_ROOT_PATH to find the programs and the
            hosttools<br>
            &gt; directory has<br>
            &gt; instead the symlinks directly present without these
            subdirectories.<br>
            &gt; <br>
            &gt; Set CMAKE_PROGRAM_PATH to by default include the root
            directory so<br>
            &gt; find_program can search the hosttools directory without
            needing the<br>
            &gt; prefix<br>
            &gt; directories.<br>
            &gt; <br>
            &gt; Signed-off-by: Ross Burton &lt;<a
              href="mailto:ross.burton@intel.com" target="_blank"
              moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
            &gt; (cherry picked from commit
            7847f431cd8db59fce8c9401a603c4b0678ee16d)<br>
            &gt; Signed-off-by: Armin Kuster &lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
            <br>
            Given the fallout in meta-oe, I don't plan to take this.<br>
          </blockquote>
          <div dir="auto"> </div>
          <div dir="auto">+1</div>
        </div>
      </div>
    </blockquote>
    <br>
    So is this why to took me on a 3 mile walk up a hill?<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1so131wZ80vgLm3KRu9DnBa=P08B=eJFwSNUb-BpAYJbnw@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            Cheers,<br>
            <br>
            Richard<br>
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
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------2C87C8552F31E031E9189DE4--
