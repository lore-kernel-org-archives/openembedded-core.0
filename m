Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPcBS-0003db-4U
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:18:15 +0200
Received: by mail-ve0-f179.google.com with SMTP id cz11so6773825veb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=uc4gAv4irUEIhL/EmLRnnBXIDUPxd1b2moO9ze92OCU=;
	b=iQg0eGoZVyk7TbID3+9AyqGochQ6ynZwpO7r2usnSbDaxpG209ZL/em7XzqdyCI+XT
	uGKHXVEdkVEMH/4io6wDh8Al/z9tsbF7hCBYb9XkJWtiMXQLcvj0M9P9Vb/C4pYgo6f6
	GJSkQZZD9yI6DdAZ0RHN+p0mALZwdMcj/ZLF/lP9CFZ2xC96ZIBG47leWXOHBnZKzGU0
	CzoE4EksjU/OU/UZjfct6gsn81Rn/CH8YxgIRG5HRlVeN59nJAf5PnMZucrKJy4vXAmX
	gRY5xU/vI33h5Z88prklpLCRTKBO03ljw60gcbjuHHf5ebshzDrhoPpzuj7PE0CKOLTp
	ld3g==
X-Received: by 10.220.153.2 with SMTP id i2mr19712884vcw.53.1365526853033;
	Tue, 09 Apr 2013 10:00:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 10:00:32 -0700 (PDT)
In-Reply-To: <CAP9ODKpdu79HJPSA7a9-q_XXP1YffeXNq6g9c=ts4ktvMJfJhA@mail.gmail.com>
References: <1365523730-15141-1-git-send-email-sgw@linux.intel.com>
	<CAP9ODKpdu79HJPSA7a9-q_XXP1YffeXNq6g9c=ts4ktvMJfJhA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 18:00:32 +0100
Message-ID: <CAJTo0LZOu21EYan2-wa3HSVfYM=rriTPozn+fdb4Xme=bABFVw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlCcm48e+9dcIAKQ587abLsuorskk5QKWXATXaGXxgcTwqMyCT7kb0Xnrv1HEPtH46R6JCo
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: fix init script for the location of udevd
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
X-List-Received-Date: Tue, 09 Apr 2013 17:18:20 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 17:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Tue, Apr 9, 2013 at 1:08 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> Ensure we can update the script base don the location of the udevd installation
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> This does not work as we have systemd-udevd as possible binary.

But these changes are in the "udev" package, so will only be used on
systems which are booting udev.

Related, all of the changes happening to udev need to happen to systemd aswell.

Ross


