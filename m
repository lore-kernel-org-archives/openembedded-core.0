Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tt06o-0000w5-B2
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 19:10:39 +0100
Received: from mail-pa0-f72.google.com ([209.85.220.72])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 09:55:24 -0800
Received: by mail-pa0-f72.google.com with SMTP id fb10so1819135pad.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 09:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:message-id:date:from:user-agent:mime-version
	:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=5a3swbegoLEOKTY676f2nQnbnY6Kd2nM8uykDfe9JPQ=;
	b=cd0lWSWhgY0Nl6bcF60Jzxxg84utb3z/ICQ7uTwFK8HfzxOm+rgyNwFujqBhrziEOH
	VnY1otRToMo8vyKsH7aO5wCAjyS3qy2x+ogkjIJM+IXTBF5WSOJT8dj2PBQ+h54Catcr
	cKD3+BNsAod4B1gAQ0w4QJJmPq3q3lrKkM3+FHJSv+L9KsMdgZMDwJNOL2VYAqXw8q+V
	qCx1mo3qUZ7VTmWWPv5RLuE7BWcVzpD+6jNAJBYzX6P4BNl3kYkOnwcjF79ksOsiAu3C
	W3gr1iIRT6qHOxzt5+1OutGh/1POdNYMYkJ+JsynWwy1owekH+rQKngGLgMbErX4BSJb
	JS3A==
X-Received: by 10.68.234.36 with SMTP id ub4mr213304266pbc.68.1357754124281;
	Wed, 09 Jan 2013 09:55:24 -0800 (PST)
X-Received: by 10.68.234.36 with SMTP id ub4mr213304240pbc.68.1357754124129;
	Wed, 09 Jan 2013 09:55:24 -0800 (PST)
Received: from [192.168.1.137] (c-76-115-207-118.hsd1.or.comcast.net.
	[76.115.207.118])
	by mx.google.com with ESMTPS id d8sm43185015pax.23.2013.01.09.09.55.22
	(version=SSLv3 cipher=OTHER); Wed, 09 Jan 2013 09:55:23 -0800 (PST)
Message-ID: <50EDAF03.5@intel.com>
Date: Wed, 09 Jan 2013 09:55:15 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1301090752510.25391@oneiric>
	<7E75003D-F6FC-4B4B-9FB8-A84DB5CCEDC8@gmail.com>
	<alpine.DEB.2.02.1301090923001.10155@oneiric>
In-Reply-To: <alpine.DEB.2.02.1301090923001.10155@oneiric>
X-Gm-Message-State: ALoCoQmEPeyGexgRUc3z3Md3SE70uRuBhSVa2U6gYgiynZg9N0HQ0tBoIu8UQIBlLyhOEqUREQ/+dfqqjxXFxiOH6lWGHSbgf7swMD2RwxpBK5XLC95Rn/7NVyfroPaXMMVuqcFMeY2Lzv7xBzi4Xen8E0UGeuC+QXq+z3FnxUUz4oxxonMI2x3mv5Nyv+Kkv1xka38pkmFp
Subject: Re: for a quad-core machine, shouldn't parallelism be set to 8?
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
X-List-Received-Date: Wed, 09 Jan 2013 18:10:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 06:26 AM, Robert P. J. Day wrote:
> On Wed, 9 Jan 2013, Elvis Dowson wrote:
>
>> Hi Robert,
>
>> On my i7 quad core machine, I've set both values to 6. Setting it to
>> 6 appears to be nearly the same as setting it to 8, I dare say a
>> marginally faster by a minute. I can build core image console in
>> around 22 minutes.
>>
>> Elvis
>
>    i recall someone (richard purdie?) once benchmarked to check the
> benefits of increasing parallelism and while it's obvious you'll hit
> the wall eventually, it would still be nice for the documentation to
> be consistent.

FWIW Robert, I think in the cases like this where the patch is fairly 
trivial, I'd recommend just submitting it and getting feedback on it. In 
general I've found you've raised some legitimate issues, but the fixes 
aren't happening because patches aren't coming in, and things like 
documentation consistency on this level is not going to compete with 
other issues the developers are munching on.

Just a suggestion,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


