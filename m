Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC5A60079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 18:29:46 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id a5-v6so4652696otf.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 11:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5eJpnbEt1jwCU6Q/2QWjdmSYeXgTLsbwtgYKivBxj9k=;
	b=MILBcLpoVw4mcUviV2j0dNgA+fM+e+hkL/yMaCA/vAG0tF4jSyyg3zjcQ19unT/zYI
	V8/0zT0m4iXdLFrlTMzn3mkyWcuCGlxO2dwgVxkOKDargGhhonr5JuR/Gbc9zZBMfyRm
	PfneaVGBzSko9ePjSKc6rgN/RZ+8QR1DAOp9+rQM2oAY7UVLn8nG9o7isYiPo+ayWgtT
	TisxzWdgOMGURRalbVqZ8WjeLQNThmMmLbW/Z+zmcmZRkPYn1I/wCwQiW52N0+xrH3py
	KxQWGRj0ABMFi+rhiv6DgGcVR2skaFK27AoO06f0sZEzUsH97/eHQXuF5TWoNvtOB0bC
	kC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5eJpnbEt1jwCU6Q/2QWjdmSYeXgTLsbwtgYKivBxj9k=;
	b=bSqeXq7A5YrpTbx2t/GE8mFUIpxd4IcaIUMBPPQWl5UX2zhmexuNRpksL8tZptOIM2
	1Gqth7jlzxteo0kJYITElsW33rq4fFGCIDMcyId8kKLg6q9uxwZidq76RpSc9a7DozfK
	WdFcHm4d/VQwaQTpDRwzeKzlErpAttot9gTRwiMG+t8bc6ixvCmN0XHlr7qhCuzj0cEN
	OyZOEaNddsz3SwqOu7fAsEqbRNHqNSq+D9+vTPTBZ69ImygayUZGjO5XImpoOlWKkkIF
	ni+S9zKFYVW6rnPIQJVA/lAL67B/9K700toiG4A2bvZ0AJm1pyuhHcMtdcEPh7OBowC6
	Dt0g==
X-Gm-Message-State: APt69E3H1GWvbOGVuuU5DmW86DhXBDTIEvyQuAQz1XHpg2U0qtIwAXHZ
	16ojqxo32vGb441LvxY+4arAUfDdFHNgZn7jLnJ1Bw==
X-Google-Smtp-Source: ADUXVKKXZwuUFHeZxfTMP/bJdeX63cegmi6soDtQFNSKqI8srVP3S/JMG+TP2KDS0cP2oCo75nVWebK+wBsnrDLGNkQ=
X-Received: by 2002:a9d:627:: with SMTP id
	36-v6mr15229840otn.168.1529605787376; 
	Thu, 21 Jun 2018 11:29:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 11:29:26
	-0700 (PDT)
In-Reply-To: <CAJ86T=XB3MAAPU5_vJXXdMHO+84wi7-epjj9BEpXPDjKKf-7TQ@mail.gmail.com>
References: <1529570060-22244-1-git-send-email-maxin.john@intel.com>
	<CAJ86T=XB3MAAPU5_vJXXdMHO+84wi7-epjj9BEpXPDjKKf-7TQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2018 19:29:26 +0100
Message-ID: <CAJTo0LZ-0oejBOFuZfDRfh-gKtf1a+=2pQ_j-FbfNRgW2SHKEA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Thu, 21 Jun 2018 18:29:46 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 June 2018 at 18:48, Andre McCurdy <armccurdy@gmail.com> wrote:
>> +FILES_${PN}-dev += "${libdir}/cmake/harfbuzz/harfbuzz-config.cmake"
>
> Perhaps we should move the cmake.bbclass packaging rule for these
> files into the default packaging rules set by bitbake.conf?

I was considering that too.

Ross

