Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 70F2D6FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 12:35:23 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id d63so192917659ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=s78mKqTzpYzpOhBt9/5iqPTvJ3S/qY2WliVKUTQ12bg=;
	b=asb+74o4WF1gzk+kGSexjkk11DyMHwRPNciZK1NlJMxoKhRiTrHsqJssEkL4TEKIbz
	rTwlmA2bJu43ZbcnQpK2zkArTshZquUzxUH/19VxpBy/C0TKxduWHxto2OgNQu7hF5ic
	IP4N2UOfCcxJ3zk7X1L1GL4LOTwFTLvu6T0IPz6OyvMrp9BJnU96yoSGytzFcxe3V6ga
	q/byXEpgqBz/EncQkNRlK/DmHhHRvZex5IwUtUNtuFmDhSa/aRD9XUPNZ4kQ8j5nJqTN
	Tbg6tfGXEfJEAYbOqgCTgPEebAkpXywpswWhsFPdLBuGydRsmjTzKVojzzIU/thRtBNM
	A+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=s78mKqTzpYzpOhBt9/5iqPTvJ3S/qY2WliVKUTQ12bg=;
	b=Bq8Jep4bJfYOGvyQA25i9es7cbPyMcwoLF2M6QH9/f4zJ9aBy1kzazJj9/Z+BDhUDJ
	tsG+i0vfHcFfC6HtnRec4N/qLWmnJjoedJrpyQAQhUlPdVYfA/4P9pEXTLk1N2rEai0y
	DDBX0jaHEf+JM2eagjASzRTJG6v0w6yN40dkcsLi9r3XfpC67rGp286z4qQV3Pu0qeFd
	I7rtH8ZdNmCSm/MPhFoHkLy8rBzQZ1UsOKXW15384xk9PWugXP3u8m4vwoQ/Rdn/z6Jo
	U4+R6o2EuE++24oFAwml91uQnIF/AAjq5l4TElfSV1yPB2BiVGzNQx60pPizmYAqXSVu
	DqBw==
X-Gm-Message-State: AG10YOQYrvW2bfyCl1PbOaaALDq9zx8R4qQwNXovZ5l1TIgQ1FkhP7dhQ5bTiWjEJnsC5B/g
X-Received: by 10.107.132.214 with SMTP id o83mr28659873ioi.32.1454934924096; 
	Mon, 08 Feb 2016 04:35:24 -0800 (PST)
Received: from pohly-mobl1 (p57A57FB6.dip0.t-ipconnect.de. [87.165.127.182])
	by smtp.gmail.com with ESMTPSA id
	w191sm12430492iod.30.2016.02.08.04.35.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Feb 2016 04:35:23 -0800 (PST)
Message-ID: <1454934920.8641.4.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 08 Feb 2016 13:35:20 +0100
In-Reply-To: <1454921553.16142.42.camel@linuxfoundation.org>
References: <1454914617-2042-1-git-send-email-patrick.ohly@intel.com>
	<1454921553.16142.42.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: paul.eggleton@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: remove out-dated information on request
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
X-List-Received-Date: Mon, 08 Feb 2016 12:35:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-08 at 08:52 +0000, Richard Purdie wrote:
> On Mon, 2016-02-08 at 07:56 +0100, Patrick Ohly wrote:
> > buildhistory.bbclass by design is incremental: each build adds or
> > updates information. Information is never removed.
> > 
> > Sometimes it can be useful to reduce the information only to those
> > recipes that were build during a specific bitbake invocation, for
> > example when the invocation does a full world build.
> > 
> > This is now possible by invoking bitbake with:
> >    BB_ENV_EXTRAWHITE=BUILDHISTORY_REMOVE_OLD
> > BUILDHISTORY_REMOVE_OLD=1 bitbake
> > 
> > In this mode, buildhistory.bbclass first moves all existing
> > information into a temporary directory called "old" inside the build
> > history directory. There the information is used for the "version
> > going backwards QA check". Then when the build is complete and before
> > (potentially) committing to git, the temporary directory gets
> > deleted.
> > 
> > Because information that has not changed during the build will be
> > reconstructed, a git log will then only show real updates, additions
> > and removals.
> > 
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> 
> The implicit assumption here is that you'd only every build large
> targets like "world". A "bitbake bash" isn't really going to do what
> you'd expect/want.

Yes, I know. I think the "reduce the information only to those recipes
that were built during a specific bitbake invocation" is a bit clearer
about that than the last paragraph, which assumes a full build.

> I think we need to make that clearer in the comments and that this is
> only useful on automated infrastructure.

I wouldn't say that. One could do "BUILDHISTORY_REMOVE_OLD=1 bitbake
<something> && bitbake <something else> && bitbake <even more>", and
that would work fine also when doing manual builds. The drawback in that
case is that the version-going-backwards check does not work for
<something else> and <even more>.

Perhaps it would be more appropriate to replace BUILDHISTORY_REMOVE_OLD
with "BUILDHISTORY_RESET"?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




