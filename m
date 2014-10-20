Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id D80B6607A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:59:35 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id o8so3445461qcw.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jMRyqBysQ+XSqMxEyWsgojKqMk+h88ZPpE9ZA2my7hA=;
	b=bThuu/5tulADYwpjJuxDjPw8D0w3mwkVoQ6J1fK3RLMnMgXBXEHwqhEQAbX66ub1LO
	jW+cKPIBTcaDxItIyvXa9LT4/JxxEIsIXwVW0ZDD5CNd0OxnRV5YzDvuBDz5Q5KXE6hV
	SehJw22XxoOiBoKOUEkCC/5Ox2EehuAlzyDPRpTLn6Fz1TI06uAJbt2eeHVoXkhDx6i4
	diMTPkPVTaUtPrahid+Wx3XsckQ5GhtZ0jMp83lKHO9bCn2z+sABlkKBxss3SzYBJHVX
	Y31eXQmjpiNMltfFbNWSwwBFcRt7uxB0pUJBLyhDjgOHjiSy1GZ1HCaD3AqWbQYxhrKE
	+0JA==
X-Gm-Message-State: ALoCoQnH6Ux7QtqYvpuQ3ljg1zQ2ou8xJxYE4s661vhx/0ncqnNMoV2QKXUMFpXk3ohBaKhalD8I
X-Received: by 10.224.160.83 with SMTP id m19mr34649523qax.17.1413802775842;
	Mon, 20 Oct 2014 03:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 03:59:15 -0700 (PDT)
In-Reply-To: <1413364894-25626-1-git-send-email-rongqing.li@windriver.com>
References: <1413364894-25626-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 11:59:15 +0100
Message-ID: <CAJTo0LZ3p9R2CUnj_XffSQDoDE-_Cg8pmLBQ_VDu5p9TSxYc-Q@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: fix a Gcc undefined behavior
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
X-List-Received-Date: Mon, 20 Oct 2014 10:59:37 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 10:21,  <rongqing.li@windriver.com> wrote:
> Calling strncpy with NULL second argument, even when the size is 0,
> is undefined behavior, which leads to GCC to drop the check old
> variable with NULL in following code.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743

I've merged this into my MUT branch but we're very late for 1.7.0
unless it's a critical fix.  We can roll this into 1.7.1 though.

Ross

