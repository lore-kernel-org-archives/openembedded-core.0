Return-Path: <akuster808@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id A848E70178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 03:29:40 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id l131so102499059lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2016 20:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=3FrOn+1qcLjEYpTEWQDE7mTEkcYaf2eccOv3pe39C2E=;
	b=P1nGoPxnH2zIYfxd/qcEUkjti8er0lZvj/lA3UPczra+Gb1HcGyTBmwszD4KCpLS7x
	Bp5J+v1VFgmStkymfv6pdZwmzsMeGD5Nq4UyeoMgGbSvsqJqxeJI1HDaOECIE7CBs2AH
	quz9ez3CvPF2EKATF2g4pla+/3CQkQQqDXJxYPM3gBDqFN/dif03Fd80DtyMUv/eckE7
	HapDU42ZShO4cZL92c/Hc2dYlNU9wPX8W4uElfDv1RzB17z/uWIvJkvah2nTyzbt8hDw
	xmjyM77Hoi8V7NKqyUt6O7SuMMynPwqXBn+OiKVtzEpn/joJxse4oKsRrMP7gh6lM3vM
	guyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=3FrOn+1qcLjEYpTEWQDE7mTEkcYaf2eccOv3pe39C2E=;
	b=ar3QnLd4FS/d9VYS3ACZNNt3ZtJb8rPXwlGZlK3aiVK5N2fL3iUTlhqMF4HCtjhC3n
	KT8gyZymvTbxo9RKLg0jMUXo3482kVzmAxFGFpQr0TH8rsGiyHhii2AjFI2Xj+YzUbJj
	cdR4mWCH7Op4h6hleCMgwx19wnP7twODKlv6XHDNj5IYpQGXA96Xc3T55IB+wlsHQg+A
	f4zwM0MsWJiZFDoQ80abuGPz5Q2Y84uMI6qyS2PcKwpMYFvSiMFRpyjes+3+wjUmAFxZ
	JiydUKcm7bIeNT8zrYYE2auY9mco4lbKGwsYXf+NyL6SvYYqbONUwI65QKRtwqDpL+F/
	rlxA==
X-Gm-Message-State: AA6/9RkOf39BxqrVkxF1HWZ+gkYAjbMYUTyMsTw6OGlozQuLxS/QYEJ9tFIa8tgOoueVMA==
X-Received: by 10.194.176.69 with SMTP id cg5mr26305036wjc.52.1476070181047;
	Sun, 09 Oct 2016 20:29:41 -0700 (PDT)
Received: from [10.0.36.7] ([94.186.205.19])
	by smtp.gmail.com with ESMTPSA id c7sm1534880wjk.19.2016.10.09.20.29.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Oct 2016 20:29:40 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <5531053.vz3bUekSfr@peggleto-mobl.ger.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9e324da6-f2e6-67e5-749d-c4b946644186@gmail.com>
Date: Sun, 9 Oct 2016 20:29:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <5531053.vz3bUekSfr@peggleto-mobl.ger.corp.intel.com>
Subject: Re: Commit messages
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
X-List-Received-Date: Mon, 10 Oct 2016 03:29:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Paul,


On 10/09/2016 05:35 PM, Paul Eggleton wrote:
> Hi folks,
>
> I've been going through the commits in preparation for our release notes, and
> unfortunately what I'm seeing is that the number of empty or incomplete commit
> messages has noticeably increased over previous releases. Commit messages are
> vitally important to providing a readable history, not just in support of
> preparing release notes, but also if you're trying to track down a regression
> or any other reason you might want to go back and find out what has been done
> and most importantly *why*.
Also helps in determining if a commit needs to be backported to stable 
branches.

> Here are our commit message guidelines, which have been in place for some
> time:
>
>    http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> I know everyone's busy, but please take 5 minutes to read these if you haven't
> recently and try to keep them in mind when writing commit messages. No commit
> is too trivial for a complete commit message.
Agreed. We also need more folks reviewing incoming patches to help 
spread the load.

The other options is to should start rejecting commits that do comply to 
the guidelines.

Thanks for bringing this up.


Regards,
Armin
>
> Thanks,
> Paul
>


