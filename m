Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD6E27723E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 00:15:52 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id y6so2145885pgy.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 16:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=78L0gBogSWncVc3jS/3mmDQ0EWbiOSR6L0NXAwjo54I=;
	b=mMVkhqeDYe8RE3xfYl5G7/DkBCkzTWrsURNZd0zv9dSo52iYrg3Ba8xayzK1yginYf
	u7W7cW+aGGqAPAes5Zg+7jv770Kfyywj64hQnY//Qzw80mARt/7voQv/DjdKGUerpb/p
	BsXXy0pz5qsIvh0kslZL2iCQxEUEWjru5sUwO8gP+CBNO1AxwM8pxv46XSkDhged2CQR
	UMEBtEKEaRK3Hc2u6wsNLFnK80+TLT0jp1dKxAN55tTRThacGfX10P7WgX5JWYJVOMtj
	mYjJxKRQIldFCFhH1lRutAK7wB3VAH9dEi/lXj4PdP+uW/DYin8tgVHrU/13VXItySF8
	QBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=78L0gBogSWncVc3jS/3mmDQ0EWbiOSR6L0NXAwjo54I=;
	b=QmQ2f2FCbjgUz4WprfXoENoEcG0hQA+rraMCc+6AJZQ44xE75rc2LUgJoSjXv5eu83
	z389NC5QrKTilJ7Q2n6B/TNtF4dsRNA8yTTuzLEZwQyYTzqEIz8zvCzgeUCy6zKnx6DM
	yny9fcusD2uZZ+Q+IIvFiE73d4WSJkDJiVGxpoolZAjFoZsESgU8PCvSJcYQ65YcI+ey
	H1Wsg4HmqBYC4NVx5ielpUeKMTKp3xnH0JSv7KRPl0pVcZfo3q+IsEdSAeobRxub+2sX
	Y3aEhdsw+21DmBB+sBeqJS0PyRcLVfNH3HUQ1a7Vxt6yTbxaKpvwHs7CY0PaFtF4OW0P
	tHJQ==
X-Gm-Message-State: AMke39mZ1UY3J7x4XoNMsjiP1RuRgXXGY69udAokOisWGOcdmIvLn0DZq3UKPbyIpCBkkA==
X-Received: by 10.84.193.101 with SMTP id e92mr2055331pld.4.1487290552732;
	Thu, 16 Feb 2017 16:15:52 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:dcfa:13bf:34d0:bc6f])
	by smtp.gmail.com with ESMTPSA id
	x81sm15591649pff.69.2017.02.16.16.15.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 16:15:52 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <f61d63d4-5534-c721-7438-cdedeeb43ef5@gmail.com>
Date: Thu, 16 Feb 2017 16:15:51 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] native.bbclass: populate native recipe with it's files
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
X-List-Received-Date: Fri, 17 Feb 2017 00:15:53 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/16/17 3:46 PM, Saul Wold wrote:
> This allows a native package's recipe-sysroot-native to be populated with
> that packages native image files.  This in turns allows it to be used by
> scripts or other tools without creating un-necessary DEPENDS.
> 
> An example of this is systemtap-native and the crosstap script.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/native.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index ec91fc3..d9dfea7 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -174,6 +174,11 @@ python native_virtclass_handler () {
>  addhandler native_virtclass_handler
>  native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
>  
> +python do_addto_recipe_sysroot () {
> +    bb.build.exec_func("extend_recipe_sysroot", d)
> +}
> +addtask addto_recipe_sysroot after do_populate_sysroot before do_build

I think this is digging a hole that everyone will use as a short cut.

> +
>  inherit nopackages
>  
>  do_packagedata[stamp-extra-info] = ""
> 

