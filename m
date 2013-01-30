Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0ZHF-0001W8-HZ
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 16:08:46 +0100
Received: from mail-ye0-f197.google.com ([209.85.213.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 30 Jan 2013 06:52:58 -0800
Received: by mail-ye0-f197.google.com with SMTP id q9so2126475yen.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 06:52:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=2FbyKqtH7LOKMP4QwEZLhJOI9dww/TGAKajxTtnsGlA=;
	b=DXsto5OC7gFLDgTRKxUdzchywWchwQuhENcLilt4hhIZHuUCpe/W78K7eqkjrIupkV
	J59jHmwwtAtDC1XrLYharZLwHCo0GPhnHcxldjmlF8NIgizMvej9HYBNFnTUW9s5ftj7
	xDjOrTaKCnuRqP2KKH/m2znHzt5h09fNJ5WsMOKLi0uHIxcZeo0FRMaRxgG7+cDAh56Z
	LTA4JJSLcRpCAZ5kzng2BdjsjEoUD/5lkhlcJK0TkeD5X60aogJQU6NAcYn+j27uMDNn
	9pmZ0KKU22Dd0S5iUEAA+O0Na/g+OHyOpX8yMX8ol7xFD7KRH2jrRoItDzMg2yZlZjV+
	fm8Q==
X-Received: by 10.52.90.243 with SMTP id bz19mr172527vdb.112.1359557578199;
	Wed, 30 Jan 2013 06:52:58 -0800 (PST)
X-Received: by 10.52.90.243 with SMTP id bz19mr172522vdb.112.1359557578081;
	Wed, 30 Jan 2013 06:52:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Wed, 30 Jan 2013 06:52:37 -0800 (PST)
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE045DD5@SOUTHSIDE.devonintlgroup.com>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
	<c9683f65462fdbe2c0f3034f1740fd6bad721bf4.1359554291.git.richard.purdie@linuxfoundation.org>
	<B57A220D1EE1644685BA9AD5C790D20526BE045DD5@SOUTHSIDE.devonintlgroup.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Jan 2013 14:52:37 +0000
Message-ID: <CAJTo0LbHAy3KDLjAL4hxKhPxm--q20R4KS12e_0YKTAykve1MA@mail.gmail.com>
To: Ian Geiser <igeiser@devonit.com>
X-Gm-Message-State: ALoCoQkUShIszY/QAgf1M4Pq930daOzs6dsceFN6y8vIfArLveW1VVa1QycySsplk2K2NWkYoBVe3VCD9yRLzxZGnGgh7zFsxkFOG0IB/1rqoGw/0GRMICxr8qegFJo8U8eBpUAREequjYrJPOePEYoJgfANcs7n5s7IqX0nCNjpdc1lNWj9ONJIG4aP+WIcTE+7N9Uvd6oi
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/17] directfb: Explictly disable mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 15:08:48 -0000
Content-Type: text/plain; charset=UTF-8

On 30 January 2013 14:43, Ian Geiser <igeiser@devonit.com> wrote:
>> Without this, directfb might build with mesa enabled if present.
>>
> Is it possible to make this tunable?  We use directfb with the mesa dri drivers for opengl.  Maybe enable it only if the distro features contains opengl?

I was just saying to Richard that if someone wants it, we can enable it.

Basing on the "opengl" distro feature makes some sense, as long as
people are aware of the interaction between directfb and opengl,
especially on platforms where Mesa may not be the GL implementation.

An alternative would be to make it a non-default PACKAGECONFIG option,
so you can enable it because you know that you have Mesa as your GL
provider.

Ross


