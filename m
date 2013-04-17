Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UST5b-0007ki-NK
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:12:01 +0200
Received: by mail-ve0-f170.google.com with SMTP id 14so1455437vea.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=lvnkBEQcmt9nMFNmYuxiqos9iPgOPzb7TYpLzvN5YZ8=;
	b=XVwyLk140BjchcbfOdeUT1EI4BNUBaHygLGPDixI1AqFr9JDODRYWmvfMp+DnIm5lw
	GZoALNVKD3QykvhDQEBBoOX9zWSABRwvc2o27vgaL62bSGr696xkuOXISf37Nmi0CpXU
	Ry0ysPKLoQM6h6GkG/CTv3CJV2xYv/4m8FowT7tEZNUwgJZB+RcrUEQpBGcOStv/JRd4
	Ow0Qd3M+4dulEHmhyqKMtsVxVZt3WTsrfiqwAa7M/3Qav+vsVTd71JGsYLjaX3V+X7bq
	SrtNx54UV7fFa9WpmmpBTa2vsCj8II8nj2nRJEZDZYM4JbRQQiHD6co6JZ7xT3ErV627
	gbRg==
X-Received: by 10.52.158.163 with SMTP id wv3mr4206146vdb.82.1366206867618;
	Wed, 17 Apr 2013 06:54:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 17 Apr 2013 06:54:07 -0700 (PDT)
In-Reply-To: <D3C4D5BE-79FE-4F92-B9C8-3B6710142DD5@dominion.thruhere.net>
References: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
	<1366205668-19096-2-git-send-email-ross.burton@intel.com>
	<D3C4D5BE-79FE-4F92-B9C8-3B6710142DD5@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Apr 2013 14:54:07 +0100
Message-ID: <CAJTo0LZa9+U6JDB+Fzm=RzxNWrcSKnRXFUh4kRTc5peZqibgvw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlTL3ygtp7wX9sxBGDkYWK0T+kjHtp/cG+Fyjora15wCvLw7RT4lqQElY20YQLJ+S69PT45
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cairo: drop transform patch, it's been rejected upstream
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
X-List-Received-Date: Wed, 17 Apr 2013 14:12:03 -0000
Content-Type: text/plain; charset=UTF-8

On 17 April 2013 14:46, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 17 apr. 2013, om 15:34 heeft Ross Burton <ross.burton@intel.com> het volgende geschreven:
>
>> This fix was rejected by upstream, the correct fix is actually to fix libpng.
>
> That fix is supposed to be in libpng HEAD and appear in 1.6.2:

Yes, that's where the patch in 1/2 comes from.

Ross


