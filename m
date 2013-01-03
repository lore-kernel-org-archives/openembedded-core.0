Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TqjZk-0005Od-SB
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 13:07:09 +0100
Received: from mail-yh0-f71.google.com ([209.85.213.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Jan 2013 03:52:03 -0800
Received: by mail-yh0-f71.google.com with SMTP id 22so6803452yhr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 03:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ywt2vOR89+X1ZTti36TzgDIqUSkBlxkJjhBsgvW+RqQ=;
	b=SwGQRsGydM3ll24bXr7tBJ8IZgCZGNevXmWZLPe0T3yqTgNmr1rU3oRc7R/Mk+ItH7
	YrAFyFQzU8bW2wPOEVzCUFx+GhMQy5qRBlvkxCegYvbbNnN5wxGgrZYaPUQoHUn6BD/Y
	T+OQ2FIsgIU4II8ecxjSGVMtYiUst5x7AzGheIoPivojTBBw5335UsvZD5Cqa0Rur/vM
	NnFUeEaZj2qxLTZW5NrTbNLiNc12/GQ5+Rcg9WgXzgSviqbbYKFIjm1kz+sX4i0maH0k
	eWLsudwwoSKE4n8EY4vM0hyKiYA/PjxROZ/kc5zQj+MYy3WBIZ2g9pA1itSHXI7/6qgZ
	m8RQ==
X-Received: by 10.58.198.164 with SMTP id jd4mr75860732vec.34.1357213923092;
	Thu, 03 Jan 2013 03:52:03 -0800 (PST)
Received: by 10.58.198.164 with SMTP id jd4mr75860727vec.34.1357213923012;
	Thu, 03 Jan 2013 03:52:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Thu, 3 Jan 2013 03:51:42 -0800 (PST)
In-Reply-To: <1356947154.28649.21.camel@ted>
References: <cover.1356626500.git.sgw@linux.intel.com>
	<1356947154.28649.21.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jan 2013 11:51:42 +0000
Message-ID: <CAJTo0Laa5CJzuEOCpZ_ksXf-fxCdQWKfEOJBTtwJD-9FLeGnBw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQndQHu/pCgWyUL3fHPGJ0OXkE6+cPtbYEldxsOkeGx0TVTOwu2o+hEdT9Wsbg9Ub8C0E+7IWwjmimaGtizchGbqW6mnv27GyWXs1c+F0VABU/vlIt0mgxqhftsPxDcxjBkGnuyezSvvK9H5YjuZuNI+BVqNoEA7TaSe3deTZY1xZPtMtjvz3LTOalJReqEsYavrzva8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/26] Next batch, mostly updates
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
X-List-Received-Date: Thu, 03 Jan 2013 12:07:09 -0000
X-List-Received-Date: Thu, 03 Jan 2013 12:07:09 -0000
Content-Type: text/plain; charset=UTF-8

On 31 December 2012 09:45, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> Noor Ahsan (1):
>>   cairo: Adds libxext in X11DEPENDS.
>
> No, we shouldn't be depending on libxext. Ross will not be happy about
> this. See Ross. Ideally we shouldn't have libxext in the images at all.

Cairo actually uses Xext, because that's where the SHM headers are.  I
suspect you're thinking of libXt, which as you say should almost never
be pulled in.

Ross


