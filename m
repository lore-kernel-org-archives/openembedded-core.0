Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 11B0F7D3A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 19:59:19 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id b13so2791010pfo.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=ssW6gWuW/K/EVUD27SXLoAWKn3o2ypnnmu+SgEQH+YU=;
	b=QgoDM4g/LkOdhPO+jHUrjgAgHi3rLC/9acrxEPt2pAHJ4q5tiimN21RUlqCc2WEYjb
	lpNdpomNKvI1ksBsHPGK9yqpbPRwqIhSCRdK+ddH4BE0IAMDxIu5A/IPhkGjY8eDlnzC
	N114kFcD99y/VoLUMKdddHVsOIFn+S2uAOMWUOkjGtML73B/QyaqwMZaNitUaeyZ1j+9
	FSPy5BmqdHZu9UCPtKSk+24VGXg6HN8cEX+VITjwWmAFBmj788dq4sqpSwdNe5M+BUuD
	Xtq3LhYVW1Nv4Ve3x+7/G7t3jOvOGx3jtxuZGprPznmAWTB6QLvs7QNG93IK5nN+l7c8
	IH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=ssW6gWuW/K/EVUD27SXLoAWKn3o2ypnnmu+SgEQH+YU=;
	b=c5s+riGzeSi+Dw1jKCvAsc1fHZ+5CpFNO+WpnY/faQHbFEGDuJ1erPFbkYGIFK4gOA
	GM7uhwB6nEe2DpeI2wjHrbKhuH1lmmxOZl3noIJHT+689SJ+CpTlhX9ydPPngkOqfcym
	SYAn3TxXj3BiWAIBlaH/bam1HeGp0TlG4kL3NGUt5dYIyaBcO2Cvj4NuQ3d88RAVLsBf
	f4i/8sMrsF72E8UCh8TjUFR9/tjFpyjSHNKRP4ZENm5XE2u+cNqczi+schblpF2YL86k
	1cnsqnQtuuMyMMicXi5X0Tzq/ItzluzEhZnXOzcf+M57M8vFnTaioX4rR+P4Zw6f7jCh
	pfSQ==
X-Gm-Message-State: APjAAAUpnCfRLhOuwW9qY94bNJAKv1wCIMW86cSYmo3fFOWybMnruDJj
	1sGL5LrujacEXxnt5d/HJzb3aCZ2
X-Google-Smtp-Source: APXvYqwUdvoPw+F0ITY46RdVuC6IbRMFcjMKc97GWM5L/6q3iCbMcgt/oZxnsdkT4eWni2liFoxpbQ==
X-Received: by 2002:a65:64cf:: with SMTP id t15mr26079395pgv.88.1567454360745; 
	Mon, 02 Sep 2019 12:59:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	d15sm8462998pfo.52.2019.09.02.12.59.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 12:59:20 -0700 (PDT)
To: Benjamin Esquivel <code@esquibits.com>
References: <mail.5d6d308e.05fc.29fd19260c1acb5c@storage.wm.amazon.com>
	<0101016cf285adb9-e8e509b0-b86d-42cd-adff-7e6d52c82f63-000000@us-west-2.amazonses.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7fb4b133-147f-4761-b3b1-43106a2fd68c@gmail.com>
Date: Mon, 2 Sep 2019 12:59:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0101016cf285adb9-e8e509b0-b86d-42cd-adff-7e6d52c82f63-000000@us-west-2.amazonses.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu-native fix for latest kernel update
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
X-List-Received-Date: Mon, 02 Sep 2019 19:59:20 -0000
Content-Type: multipart/alternative;
	boundary="------------222D5FEF4A74F937C3F0CDCB"
Content-Language: en-US

--------------222D5FEF4A74F937C3F0CDCB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Benjamin,



On 9/2/19 8:09 AM, Benjamin Esquivel wrote:
> qemu-native fix for latest kernel update
>
> Thanks Armin for sending the fix for the latest kernel updates, my
> build strangely started failing about a week or 2 ago after the latest
> dnf update.
>

Glad it fixed your issue.

Thanks for the feedback.

- armin
>
>  
>
> Regards,
>
>  
>
> Benjamin
>


--------------222D5FEF4A74F937C3F0CDCB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Benjamin,<br>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 9/2/19 8:09 AM, Benjamin Esquivel
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:0101016cf285adb9-e8e509b0-b86d-42cd-adff-7e6d52c82f63-000000@us-west-2.amazonses.com">
      <meta name="Generator" content="Amazon WorkMail v3.0-4482">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>qemu-native fix for latest kernel update</title>
      <p style="margin: 0px; font-family: Arial, Tahoma, Helvetica,
        sans-serif; font-size: small;">Thanks Armin for sending the fix
        for the latest kernel updates, my build strangely started
        failing about a week or 2 ago after the latest dnf update.</p>
    </blockquote>
    <br>
    Glad it fixed your issue.<br>
    <br>
    Thanks for the feedback.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:0101016cf285adb9-e8e509b0-b86d-42cd-adff-7e6d52c82f63-000000@us-west-2.amazonses.com">
      <p style="margin: 0px; font-family: Arial, Tahoma, Helvetica,
        sans-serif; font-size: small;"> </p>
      <p style="margin: 0px; font-family: Arial, Tahoma, Helvetica,
        sans-serif; font-size: small;">Regards,</p>
      <p style="margin: 0px; font-family: Arial, Tahoma, Helvetica,
        sans-serif; font-size: small;"> </p>
      <p style="margin: 0px; font-family: Arial, Tahoma, Helvetica,
        sans-serif; font-size: small;">Benjamin</p>
    </blockquote>
    <br>
  </body>
</html>

--------------222D5FEF4A74F937C3F0CDCB--
