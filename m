Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3mMa-0005Qc-4M
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 12:43:42 +0100
Received: by mail-ve0-f176.google.com with SMTP id cz10so3116048veb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Ju+il+HBaFcNJEp+KRHTKgv0zja/fuWH4L4gqbVv97M=;
	b=BGqcax3lR0E8BI7GGd+5ojnOu3NwnxfvNdOV7E8Tis3L36OsW477Pgrfbm4xlZpg+l
	qewAQyg3v0BpOwjoj9SZ5PGmFMQW6a05C16NOvhcw9tVosaSF+4BZ/qzWZ/YdpijMgVu
	OwBln66FWL9a2rhPrcTIxCE1i8h2PZeKl75GqYhBHb8pkdVpWuA8T75bAlyFy4EgcUOX
	ET2Vc069hsGUaS+dh8jJYV7fu9RnpCJM3nXua7GGTsSXFDF/Zo5fvy1eyDTXAlX7Nv8+
	6/yPeArnkKdMKJM8GTLmQw45SsD96cWAbD3c0jv9MIhvHEPNRmj9wjVI2O9HB45Je0/d
	rMJA==
X-Received: by 10.52.23.18 with SMTP id i18mr5343594vdf.46.1360322852313; Fri,
	08 Feb 2013 03:27:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 03:27:12 -0800 (PST)
In-Reply-To: <1360300321-4543-1-git-send-email-denis@denix.org>
References: <1360300321-4543-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 11:27:12 +0000
Message-ID: <CAJTo0LYxTC+aP6k39Qx57k7QmNqTRRdLuABdg4N+vJ4youhwyw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQnQZWENcQSPcE1jgC2+YuR2l1n2LLW/gwLlLS2IxBw+cIzT/1hgovxyQfdrG99NFDRWC+gW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-danny] relocate_sdk.py: new interpreter string was not '\0' terminated
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
X-List-Received-Date: Fri, 08 Feb 2013 11:43:42 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 05:12, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Laurentiu Palcu <laurentiu.palcu@intel.com>
>
> The problem: SDK binaries were not properly relocated when the SDK
> was installed into a path that had a length less than the default one.
> Apparently, there were two problems here: the padding was done wrong
> (the size of one program header table entry was used instead of the
> program section size) and the new padded string was not used at all.
>
> [YOCTO #3655]

Merged to danny-next.

Ross


