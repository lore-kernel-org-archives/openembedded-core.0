Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id C960F73193
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 03:23:05 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id y8so69855497igp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 19:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=9Pgj1mwrmuRn5ImsyjOvHvgDURq+xbBeYL2VVqixyFo=;
	b=pE6SUtcoP2HpdUDXIkvPppfS10Kr3IJSDb4LCFzLiTLI2nKnSzh+3Ikx38tfBsUZOW
	l4IHgf1j04JbBqm7dZ+CYlpdFHImHJc9+MhFNaSAKe9QnOGPR+SWjAS6YGg61Jv1stU5
	X12wA+8I7oCAXbfpK8nkI+9u13GpbCpQD+ZSx/Ir52BiTmMlTZEirqGAOcWlF7sXLyFO
	inamhU8vO/YMF6IaRv+R59qjUJfk/6Dp8vuzcvXB9Cy1FPaKJjvjYIzX/p6tOI0YZ7y+
	n9pukFliaj46poGnR5QFdptHSRxAorQCljB27MXm6TodoFjBXia2CKxdBRSJfoxHSmgT
	Z1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9Pgj1mwrmuRn5ImsyjOvHvgDURq+xbBeYL2VVqixyFo=;
	b=F9KoXz6PX+XqP645drylpKnZ1oHf9tGiRfGRfDBuYD1aphuCmIGLwDofWLpChNradU
	IBklBc4KU+FB6qwri+agaBbrPpsVPN76fBKhYM8NY1q74ptNzu636hE0gWdT4hukSMjq
	7WwiIeKgp567DLQnAlhs2Uk8A1g1DPuJWYJzUvXyX3JekqdAY1E3MMZYyzH5kMKPpzKx
	21YjgsXak6HCwXE4Y/TAdX7NFgO+cODD+/3adlE0ZcZKAMhLJjUsBWPLPep9jZ6Q/I+s
	el0ZMXZXpE0bdhgW8rKI2uWhe4bAOuSWQmWpHVXbMfLXXDIZCHuGaxZKQi0NEUjp5Loz
	r7BA==
X-Gm-Message-State: AD7BkJJq19kCrPysVOnmjhxXJM72BPVkUC+OqTYhSA+PLrJwqZLRwPp2IAfdVwN3aNeWww==
X-Received: by 10.50.110.5 with SMTP id hw5mr8494030igb.54.1456716186912;
	Sun, 28 Feb 2016 19:23:06 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	t2sm6165963igs.3.2016.02.28.19.23.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 19:23:05 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	brendan.le.foll@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1456412817-12106-1-git-send-email-brendan.le.foll@intel.com>
	<56D24503.9010803@gmail.com>
	<1456648351.11498.130.camel@linuxfoundation.org>
	<56D329B5.5090101@gmail.com> <56D33008.9010306@gmail.com>
	<1456701206.11498.174.camel@linuxfoundation.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56D3B99A.2040008@gmail.com>
Date: Sun, 28 Feb 2016 22:23:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456701206.11498.174.camel@linuxfoundation.org>
Subject: Re: [PATCH] npm.bbclass: Add npm class to match fetcher
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
X-List-Received-Date: Mon, 29 Feb 2016 03:23:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/16 18:13, Richard Purdie wrote:
> On Sun, 2016-02-28 at 12:36 -0500, Trevor Woerner wrote:
>> Thanks!
>>
>> I guess I don't have enough "plumbing" quite yet. I have all the
>> master branches of everything I need and I cherry picked Brendan's
>> npm.bbclass but I still get:
>> Ah sorry. I needed bitbake's master-next.
> There was a patch missing, bitbake master should be good now.

Verified, thanks :-)

