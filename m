Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 996CD785B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 13:04:33 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p75so17004341wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 05:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=TeZJEE+uN+PEPeAWYXvw7p3XCTmbV3ztf8VSrNphJk8=;
	b=ttigzvlfznYyA1rhTZZHf+ZJMxm4MLvNUpttd7qYbOpVB5cN+MgGfTH7QbUvEejHgm
	wim1laoyxoknw19eaa8UsZVOZgfQ1ELX2nC6wkMrs7VEzs8oOyANXTzZ0GGcIGh55dF5
	mrlA/IKHGpLihDfhlJ4WzN04FHV05ht+8TlIROJJoFiKWblxSdwJRnOKHPmNTgV5TtF7
	AMt9qFqu3zM4kcwx1rySRrxY+kCetGkXl54dkU2vmNp3HMtwZZCjzYSXTjEHP566+U9G
	xuQKuyl9Hf7cAGFYpJZDa1xfNerYGtoWqFchg6fNQQFBsXGEKigH2fU5J/4eUxtMumQg
	Soaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=TeZJEE+uN+PEPeAWYXvw7p3XCTmbV3ztf8VSrNphJk8=;
	b=WuFvFEHSJlhMtOO/sGmEy5DzqZeFhSDz9siV9s5MDcTy0ocOhK3v//t6ufnfd0wy9Q
	x/dyg3yG6fjMke0T8532RPDn6UOiQAoXPbSIovQIO1Ec+NAv9gqecIwo55Xyag55Yuf1
	Ru97t8ITqPUMa8kd4mgQkAFBrvDpEUypilpeQctEGsfAHQSI8NTZi0zFXwmgqdLISfED
	/YNU5qjaXTbIEyRN+WUu1JqXXR03lYzbM57iqpdm1xhFCEvIPzWHA3Yrl6obXkIYpnpN
	Pp1+S5/hxXq/Bf01z6s86tZvaoP7DufFBCjQQHn932gY1Uxwbe7I70owVQGO0hZ6N5uV
	UHbg==
X-Gm-Message-State: AJaThX7ebtWx4RYTzq3Cm+j3Ci47uUxl2zG/TOy2cd9wYM8KZIueA+wW
	Eh0EFXWccginaaID+CeA9SJ0
X-Google-Smtp-Source: AGs4zMaHSGA7DF2GZCeybX5X//AGAlUY/gNqKDb9uKzAPSAT/5cAZSi3sgbTzC4cXqE49hfSpFtw3g==
X-Received: by 10.28.150.194 with SMTP id y185mr313174wmd.54.1510232674279;
	Thu, 09 Nov 2017 05:04:34 -0800 (PST)
Received: from pohly-mobl1 (p54BD58C1.dip0.t-ipconnect.de. [84.189.88.193])
	by smtp.gmail.com with ESMTPSA id
	n14sm5500500wmh.37.2017.11.09.05.04.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Nov 2017 05:04:33 -0800 (PST)
Message-ID: <1510232672.22094.31.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Nov 2017 14:04:32 +0100
In-Reply-To: <1510228551-11516-2-git-send-email-richard.purdie@linuxfoundation.org>
References: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1510228551-11516-2-git-send-email-richard.purdie@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/7] oeqa/runqemu: Only show stdout/stderr upon test failure
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
X-List-Received-Date: Thu, 09 Nov 2017 13:04:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-11-09 at 11:55 +0000, Richard Purdie wrote:
> +    # We only want to print runqemu stdout/stderr if there is a test
> case failure
> +    buffer = True

Does the value matter? The other code only seems to check for the
presence of the "buffer" attribute.

Changing this to "buffer = False" and still get buffering would be
surprising.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



