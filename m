Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id CCAF279E7B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 15:57:23 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id e22-v6so1214688pfn.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=vA7+/4xuYYo17yeHg5nERwql+ChFZDKsycblIeO1sSM=;
	b=fAVEwBuSZsU6E1F+23UzWmmoXd9e/hJGAFvoBjJD/Kn/09bP743NeAZC71fkB8T48b
	V8Geo7FsNt4hVVuvbOQdyEm1dGNpFG8Yh+u33ATu2ZbO6Xm8AIKpIEISuzpxq4kFRMmm
	5SMW+DAC0/PqQAW9y5GCI3c4d0GeSOUP/sV9McCfGNM18eQqCqWATXep4p0c/X5KJE9b
	Vs32VYy4dpvuip/cR3522nryi3BlALIJtY11d0z78q4aZEXKVTqs0BDpdVV4B7ps0nzu
	+MjNeQ2ki3s1k3sBgpshh3QEBHE4kip7ROe80mKmNMOaaRxoYtqy3tjugnWXu1JoZSyZ
	rTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=vA7+/4xuYYo17yeHg5nERwql+ChFZDKsycblIeO1sSM=;
	b=YphA8g9FGfFmMKZ6rU7rFN3Mv0ex4Y8e5NjeTZhj130/1YGKR6LHtdFEfSuUzwbQ2o
	+IMb92RSZblNliYWnEQ/d4yG+kj8wozKo7cAl9KpwuXxeex9i3oDC/r5oCt15qt5LJuV
	eHZs3D/4b4ljjt+CPmFnxQJGunBH1ReIItxT+NSa4alRYGcEgTKeQRybzZqSpKhqzObw
	kwxdg5agXN/i8tsBlQC5IjajvAlfKpQpmeHB8r+8qoavhefQUyqHRnYR5qHzQNJNNZ1S
	ZlDkoJbs2ezCIzriAIPQus8eM4x3OnUZQECFs1LSzMA7jk3U/7NsHtnq9jMBb9hGO6CP
	Wh8Q==
X-Gm-Message-State: AGRZ1gJSrVrz2GPKkRaQD3EKl19rxo83LoXl+1CkDXag5bzzGzb7zrbl
	saIvbWO1ne7L+/NDbzCcX48NqIM5
X-Google-Smtp-Source: AJdET5c/CbQSKK83BQKv2fCx6I9RRL6HubiDkzpxlaxlXWnNtJS6D7kciWpxrFNvdYnc3Tmlxiim+w==
X-Received: by 2002:a62:1049:: with SMTP id
	y70-v6mr4854866pfi.113.1541174244432; 
	Fri, 02 Nov 2018 08:57:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d25:2e4:ba80:f9b1?
	([2601:202:4180:c33:8d25:2e4:ba80:f9b1])
	by smtp.gmail.com with ESMTPSA id
	m17-v6sm1914460pfi.102.2018.11.02.08.57.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 08:57:23 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>, jdmason@kudzu.us
References: <20181101140417.GA12376@linux-uys3>
	<CAPoiz9y_prstnR5dsxHNwSk81ShLmkybEXySEESTgZrpgKXMcA@mail.gmail.com>
	<CAHUNapRrWkAGahwLgEzfbPSi2UhQCTqMSGQOAEp2Dxpi3MwRPA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <56f451cb-f059-d8bb-aae7-aca4c6bdf1a6@gmail.com>
Date: Fri, 2 Nov 2018 08:57:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHUNapRrWkAGahwLgEzfbPSi2UhQCTqMSGQOAEp2Dxpi3MwRPA@mail.gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	yocto-advocacy@yoctoproject.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OEDAM @ SCaLE 2019
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
X-List-Received-Date: Fri, 02 Nov 2018 15:57:24 -0000
Content-Type: multipart/alternative;
	boundary="------------01C3909EC2D447CB15BD31D8"
Content-Language: en-US

--------------01C3909EC2D447CB15BD31D8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Morning Trevor,

On 11/1/18 7:27 PM, Trevor Woerner wrote:
> Hi Jon,
>
> On Thu, Nov 1, 2018 at 3:56 PM Jon Mason <jdmason@kudzu.us
> <mailto:jdmason@kudzu.us>> wrote:
>
>     I am planning on being at SCaLE (assuming the OEDEM happens there).=

>
>     Many corporate travel budgets are tied to presenting at conferences=
=2E
>     So, if we could somehow get a track there (which might be too late =
in
>     the game to do now), then we might be able to get enough people
>     present to make it happen and pull in others whose budget is more
>     flexible.
>
>
> As it turns out, I'll be organising the YP/OE Miniconf that will most
> likely be run on the Sunday. I was going to send out a separate email
> discussing the Miniconf, but I guess now is as good a time as any :-)


I would like a some clarification. As fas as the OE Board knows, we had
one room available on Sunday. Is this the same room or did you find some
other space at the venue? I am a bit confused about the messaging. The
subject and Jon's statement are all about OEDaM but your addition to
this tread is about a Miniconf. Is the Miniconf a separate thing?

>
> While it's true that the CFP has closed for SCaLE, I plan to open my
> own CFP specifically for the Miniconf, and I don't plan to close it
> until closer to the conference itself. I want to encourage people to
> give talks about current things, as such, having a CFP close this
> early wouldn't do.
>
> We haven't decided on a format for the Miniconf, exactly, if we have
> traditional talks, we'll have 6 sessions (2 before lunch, 4 after).
> But depending on interest and what sort of proposals we get, we might
> do some longer, some shorter talks.


May I ask who "We" are? AFAIK, Behan and Tom are doing a *-ale tracks at
Scale.


- armin

>
> =C2=A0I hope this helps. Best regards,
> =C2=A0 =C2=A0 Trevor
>

--------------01C3909EC2D447CB15BD31D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Morning Trevor,<br>
    </p>
    <div class="moz-cite-prefix">On 11/1/18 7:27 PM, Trevor Woerner
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHUNapRrWkAGahwLgEzfbPSi2UhQCTqMSGQOAEp2Dxpi3MwRPA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi Jon,<br>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Thu, Nov 1, 2018 at 3:56 PM Jon Mason &lt;<a
              href="mailto:jdmason@kudzu.us" moz-do-not-send="true">jdmason@kudzu.us</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">I am
            planning on being at SCaLE (assuming the OEDEM happens
            there).<br>
            <br>
            Many corporate travel budgets are tied to presenting at
            conferences.<br>
            So, if we could somehow get a track there (which might be
            too late in<br>
            the game to do now), then we might be able to get enough
            people<br>
            present to make it happen and pull in others whose budget is
            more<br>
            flexible.<br>
          </blockquote>
          <div><br>
          </div>
          <div>As it turns out, I'll be organising the YP/OE Miniconf
            that will most likely be run on the Sunday. I was going to
            send out a separate email discussing the Miniconf, but I
            guess now is as good a time as any :-)</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I would like a some clarification. As fas as the OE Board knows,
      we had one room available on Sunday. Is this the same room or did
      you find some other space at the venue? I am a bit confused about
      the messaging. The subject and Jon's statement are all about OEDaM
      but your addition to this tread is about a Miniconf. Is the
      Miniconf a separate thing? <br>
    </p>
    <blockquote type="cite"
cite="mid:CAHUNapRrWkAGahwLgEzfbPSi2UhQCTqMSGQOAEp2Dxpi3MwRPA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>While it's true that the CFP has closed for SCaLE, I plan
            to open my own CFP specifically for the Miniconf, and I
            don't plan to close it until closer to the conference
            itself. I want to encourage people to give talks about
            current things, as such, having a CFP close this early
            wouldn't do.</div>
          <div><br>
          </div>
          <div>We haven't decided on a format for the Miniconf, exactly,
            if we have traditional talks, we'll have 6 sessions (2
            before lunch, 4 after). But depending on interest and what
            sort of proposals we get, we might do some longer, some
            shorter talks.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>May I ask who "We" are? AFAIK, Behan and Tom are doing a *-ale
      tracks at Scale.<br>
    </p>
    <p><br>
    </p>
    <p>- armin<br>
    </p>
    <blockquote type="cite"
cite="mid:CAHUNapRrWkAGahwLgEzfbPSi2UhQCTqMSGQOAEp2Dxpi3MwRPA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div> I hope this helps. Best regards,</div>
          <div>    Trevor</div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
  </body>
</html>

--------------01C3909EC2D447CB15BD31D8--
