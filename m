Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id B4F767309B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 09:48:16 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id 25so47674965pgy.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 01:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=7iMkcw5OyztE9Y8i2hYwBfqBxEJeaJLxbU4jTv+76h8=;
	b=LGmdZwKwsoYD8qC5UyGn0TuoXhjnOxqnG3dE4QhHW+cNZ48KSTb4sql01he3f6fPY5
	EvmIYckeCZQLhP3cAQ3mIzZKMA2uZDCkB/Gi378erd2TgthezPEp3PWz7fE8DsIkClQn
	wA8oESc0zdPWs5PGy77e5oSuX74iqaNB+Q46WGNtaJrIxs7uA7KZ3CHnuCse0hUZz2AT
	+YLZruSJGvL0seP+GY99XxBe8YNsb6blTHqvZcfCYv5pWTYGA3Gurvftv55nN/G2utfn
	wxZWL3ooWOzWzJtmStElnT/vVCNTkCzmiUhWIsGnap+4KUvp8iudNwO38xbH+EMwwLMr
	3XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7iMkcw5OyztE9Y8i2hYwBfqBxEJeaJLxbU4jTv+76h8=;
	b=H3iVWvQxKbU4nda7pLFFLpxaj6PyoV0iUms+sXVr5JHsyvKIwILj494EAHkZdjoMcj
	P1EZFH+lXMl7Yu3UXgxPnNbSDjPNaVBV/JWAMtUoGMHQG3gz/EZGxh9qFKgw5z8T6lro
	jOnFAEymlUCA+tjCmmv0K1vy759Y7b57QpKE3ZlzSBKsO1sq2GvmWrKdiNY+gBm9tzGW
	1qG4xhai9m+QJsTnYB/fh9T7p5p9FKKxqGL4mvDUo4I+WjZO31ZLMTdBCVb3qWOTEqQj
	JpSw7zse4Wq8TF4hO6UhCJ7as94+l9o63CYe6axu44HmcXZLFiE/1JZHalvCNLFp6QrA
	fYKA==
X-Gm-Message-State: AMke39mDVP/ZqNh/Q9yJNzDUvPYpBoEn9L9b4OD63UKwev/0WkzdUryzEAhMXyAobz6F/w==
X-Received: by 10.84.129.67 with SMTP id 61mr32241184plb.16.1489225697239;
	Sat, 11 Mar 2017 01:48:17 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:51e9:1748:d935:c39a])
	by smtp.gmail.com with ESMTPSA id
	m29sm23182869pfi.54.2017.03.11.01.48.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Mar 2017 01:48:16 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1703110315570.17105@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <97985b49-64ba-3fae-58a6-6eee4ad8126c@gmail.com>
Date: Sat, 11 Mar 2017 01:48:15 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703110315570.17105@localhost.localdomain>
Subject: Re: how does files/fs-perms.txt affect building base-files rpm?
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
X-List-Received-Date: Sat, 11 Mar 2017 09:48:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/11/17 12:30 AM, Robert P. J. Day wrote:
> 
>   potentially a dumb question, but do the settings in
> files/fs-perms.txt affect the building of the base-files rpm just as
> they would affect the building of any other rpm?

it should be executing fixup_perms() in PKGD before splitting the
package, so yes it should run for all recipes.

> 
>   i can see the structure of the base-files recipe, whose do_install()
> routine manually installs a ton of stuff, with very specific file and
> directory modes, which is fine. and assuming fs-perms.txt is applied
> after that, does that mean that whatever is in that fs-perms.txt file
> will override any settings already in place as built by the base-files
> recipe?
> 
>   also, as i understand it, given that fs-perms.txt is used to set
> file and directory modes for all created packages, does that mean that
> any discrepancy between a package and what is already in the root
> filesystem will cause a package installation error?
> 
>   i already ran across the situation where a package was built
> assuming a volatile log directory, but the running image it was being
> installed into had a regular /var/log directory, and that caused the
> package installation to fail. am i correct in assuming that is normal
> behaviour?
> 
>   thank you kindly.
> 
> rday
> 

