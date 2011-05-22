Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QO7Fz-00024R-9t
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 13:55:39 +0200
Received: by pxi6 with SMTP id 6so3696051pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2011 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TwnRl5szNNiFn1/gVjLQiK0LYa+o2pjpBolbEBVQ9dw=;
	b=cjUDYcX7Fnlq0N878+hf6pCaOFxw5DK21JLJmt0sm/0accTR56BCPTxJRmpNFGsOD2
	3bkUTttH5b9aU6nqPBhYBwQ7z/tbCBvk9ZDmfVYopxj8ILKWm1PW1thiuBQZgefgrlMW
	SG4N4LexaAk0UewjBgOwScp7lcpkNcBr4M5pw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DOREII5C6BP9m/E/DhEeAABc/3rTx8o7g9YUi4iRnyNS/cWVQYBlS9DN8ufL7xtXNL
	4t0RYfe6ME0GJqxaa50ccYzowVPZd9eOD246t+sZxUjzeH84GejvTDVjvxDtGuGZAuMP
	wqYVxl5FDTgxV6NCK1UAKlmWyptp9HjHVJXeg=
MIME-Version: 1.0
Received: by 10.68.4.167 with SMTP id l7mr1716185pbl.2.1306065158250; Sun, 22
	May 2011 04:52:38 -0700 (PDT)
Received: by 10.68.59.9 with HTTP; Sun, 22 May 2011 04:52:38 -0700 (PDT)
In-Reply-To: <2EE92FB6-7C05-4E5F-BF51-110A26874884@gmail.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
	<674a00cdafa9b97a66d1139ce2279c3b8f660299.1305580484.git.sgw@linux.intel.com>
	<BANLkTimLuL1MRqK_xx+bsjrQZf0MDJO=1w@mail.gmail.com>
	<2EE92FB6-7C05-4E5F-BF51-110A26874884@gmail.com>
Date: Sun, 22 May 2011 13:52:38 +0200
Message-ID: <BANLkTinH_z=RR2FWw1vjT1NDp__=NUtHAQ@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] perl-native: create_wrapper on perl${PV} too
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 May 2011 11:55:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Khem,

On Sun, May 22, 2011 at 7:12 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Andreas Mueller today reported that this commit breaks his perl build.
>>
>> See http://article.gmane.org/gmane.comp.handhelds.openembedded/45640
>>
> http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=a10bd976f4cef54ac50b0c82f885c17a26e5989f
>
> Has already fixed it in oe-core few days back

Thanks, the tipping point for oe-core becomes evident :)

Regards,
-- 
Leon


