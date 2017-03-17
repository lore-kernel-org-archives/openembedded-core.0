Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 168A677B0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 17:52:22 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id b129so46747477pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=ak2AbtJNYty+UEC97sldm6mRL+PAUb2hYZbhjrumWP0=;
	b=UubgOnxhKkvbYVB6RsLC0dUvwJb0muwwGMT5Z55utZUFoaNI3AspzUAACAmRGdiRwI
	6ge8lg7z72YnHw2CzvC/Zb3vnznYnHfgQN9bNIBs6H5duvGhFHaYLMXSt00zsfK40X8d
	N28rNu4QqbRKixv+BPVZM7yfpKJsNhVyQ0HAznYW2Ab5lVTbKxo3f52UaQoDzbe/OWlk
	BSo+yra5jRprbacNa56CzhCUNSpkKJbgxNxXCRbam4SouCVNhPuQ6I7/EXdI4a0v1pbl
	zbvKTNbOnJIkyMlXLQ4XTfWwQB2IPyCOTRJMCtGx4ybcwhud3HvwaqBkQopAkGxjjSV+
	MhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ak2AbtJNYty+UEC97sldm6mRL+PAUb2hYZbhjrumWP0=;
	b=AtmFUuXJREXxoe2GGFXqMJEjKawTlNcR+6k9psTf+GzEOk5+xm5xUmfNP44DDzgtfK
	1WQivbfkh+vR9BEM6pAL061hBPzKFmVPVT+R7STSSDL9UeLmPC7B1BPI+1pX9yFPkHsg
	Gtz4ffbMzPpkFbbaIhDRVEv/44g8/ax12BaxsGBJ/4EA/zRyZKonAgP4qI0MnQwDbf8V
	nHCuJFekwaTo76LeN8uzbBBZiN2VtUWma1qCHQlYAVuKrTT2+CtcI/x6E7rVpqedoUpz
	+eI4pPg0zTBddAwFYX5wregCN80iziH6GLW85LhlzTY0T9VUc91i97bCZ8VXuXf6xaan
	11eQ==
X-Gm-Message-State: AFeK/H2S+RZ0Ss8LMqyEWhl2ar4klski65yrkyM1sSkeOKgU8IZBQl8OhOFB5wJoo9Mj8Q==
X-Received: by 10.84.136.34 with SMTP id 31mr21187396plk.52.1489773144090;
	Fri, 17 Mar 2017 10:52:24 -0700 (PDT)
Received: from [10.70.7.178] ([103.5.218.52]) by smtp.gmail.com with ESMTPSA id
	r89sm18078443pfe.6.2017.03.17.10.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Mar 2017 10:52:23 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1489459188-15332-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5e54c568-137b-003d-f2ea-424e807c273c@gmail.com>
Date: Fri, 17 Mar 2017 10:52:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pinentry: update to 1.0.0
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
X-List-Received-Date: Fri, 17 Mar 2017 17:52:24 -0000
Content-Type: multipart/alternative;
	boundary="------------3ED865704651AA4F2C2B4821"

--------------3ED865704651AA4F2C2B4821
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/17/2017 09:53 AM, Burton, Ross wrote:
>
> On 14 March 2017 at 02:39, Armin Kuster <akuster808@gmail.com 
> <mailto:akuster808@gmail.com>> wrote:
>
>     add pkg-config support for libassuan and gpg-error
>     updated config options
>
>
> This didn't quite make M3
Didn't expect it make it in. My intend was for 
master-to-exclude-2.3-changes branch.
> so strictly speaking upgrades have to wait.  Can you backport the 
> fixes to 0.9.2,
geez, you are making me think now. I don't recall if there where any 
issues with 0.9.2 building. I am traveling and wont have a chance to 
look into it for a day or two.
> or is there a sufficiently good reason to make an exception for the 
> 1.0 upgrade?
nope. Finally sat down to hammer out the update.

thanks for getting back to me.

kind regards,
Armin
>
> Ross


--------------3ED865704651AA4F2C2B4821
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 03/17/2017 09:53 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 March 2017 at 02:39, Armin
            Kuster <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:akuster808@gmail.com" target="_blank">akuster808@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":5fd" class="a3s aXjCH m15acab19bc74744c">add
                pkg-config support for libassuan and gpg-error<br>
                updated config options<br>
              </div>
            </blockquote>
          </div>
          <br>
          This didn't quite make M3 </div>
      </div>
    </blockquote>
    Didn't expect it make it in. My intend was for
    master-to-exclude-2.3-changes branch.<br>
    <blockquote
cite="mid:CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">so strictly speaking upgrades have to
          wait.  Can you backport the fixes to 0.9.2,</div>
      </div>
    </blockquote>
    geez, you are making me think now. I don't recall if there where any
    issues with 0.9.2 building. I am traveling and wont have a chance to
    look into it for a day or two. <br>
    <blockquote
cite="mid:CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"> or is there a sufficiently good reason
          to make an exception for the 1.0 upgrade?</div>
      </div>
    </blockquote>
    nope. Finally sat down to hammer out the update.<br>
    <br>
    thanks for getting back to me.<br>
    <br>
    kind regards,<br>
    Armin<br>
    <blockquote
cite="mid:CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------3ED865704651AA4F2C2B4821--
