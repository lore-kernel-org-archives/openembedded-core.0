Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id E0A0C6D61B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 13:02:44 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d12so4354416lfk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NY2K2sY9ghd+cI6UkSJ0OR7cX1axRAGo3iFIfbflG38=;
	b=XnLEza2U0h5+bi3/OGHvXx8Xcy+9WBcSRvaFjvxncS8g88pxSQhZBLwyE9uKO3vHmd
	MQyJo9U8NbyTUPbtfjA1f1ApNnIxxQstlxcFzzr/tvuJyELBhdKZkg6WrXNPO1fIuVKp
	7m/Z7W/96SOg9lnRCArF9VDjD7T99CuZIpMyfvtCEYaSV3W564LKLFHoPt005ik4RRsR
	JimeVp0o9k3iIyL8y14bboXMuUICoF0sSWgqnzgyfzsl/+tekR5UmcsjbE5Y6U3tHLlk
	8ju74JR5BZPo5X184biImJnJcoG0m0MTEHu1IrwRaCfVCW9b6S6Z9PIigwNNfbvPkt8Y
	aLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NY2K2sY9ghd+cI6UkSJ0OR7cX1axRAGo3iFIfbflG38=;
	b=BEOi7id4on9iffv8F541HpAA4CzmlBPr3yZulq0jYKi7CLggCWcGjDYWj1RtuX2bpG
	JtPNlK9GSJxR04xaXEkbhE89X1jR6kXZ+heMAZMcg2jKIjYukptT8E82rw5fUSjNmoqC
	18G0bbCmFpL/LsATkVhmYx6lHzTdmzh+1y+X/e54Nt97gd67eFZgyZJNEo8YjJ3xo4oR
	ZLogYDwyZpomYZCwH3Uy65w7XjOj2hnN3gmeqivPwjTebixqdWVXKHO7DTObhwpP4Uu4
	zK/b9867vBzLXaSh5lJQiXeVtyC+fYfG3hjstr9DQLIFSfeXa5NV6ztvWt3bEd4G1W3p
	xjoA==
X-Gm-Message-State: APjAAAX5ruZo3PctHKDYUMtUf1OBXXJfHs1kDemSSXuJqc/rVDrchvG4
	NYHI63fIetjnXm7Z8ZnnqsL2fg==
X-Google-Smtp-Source: APXvYqycYGqD0rRrRxT1WKPcHWoD3mrxK5yshy18kEF+jislvz7MF2KemoLSLldKWVMcOKQlg4a1vA==
X-Received: by 2002:ac2:545c:: with SMTP id d28mr4944263lfn.144.1556888565313; 
	Fri, 03 May 2019 06:02:45 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	m12sm418522lfk.21.2019.05.03.06.02.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 06:02:44 -0700 (PDT)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
	<20190502210944.62696-7-alex.kiernan@gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <056a4682-9e58-ef48-8aea-c8867d2cf32b@norrbonn.se>
Date: Fri, 3 May 2019 15:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502210944.62696-7-alex.kiernan@gmail.com>
Cc: Alex Kiernan <alex.kiernan@hivehome.com>
Subject: Re: [PATCH v6 6/6] image: call systemctl preset-all for images
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
X-List-Received-Date: Fri, 03 May 2019 13:02:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

On 02/05/2019 23:09, Alex Kiernan wrote:
> From: Alex Kiernan <alex.kiernan@hivehome.com>
> 
> Rather than rely on systemd's default invocation of preset-all at
> runtime, we pre-populate the symlink tree as part of of the image. This
> is done late so any overrides of presets during rootfs construction
> should already have happened.
> 
> Whilst we don't strictly need this for the read-write root case, it
> avoids boot time churn; for read-only root we have to do it here.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
> Changes in v6:
> - moved systemctl preset-all to IMAGE_PREPROCESS so it runs after ROOTFS,
>    run for all images, not just read-only
> 
> Changes in v5: None
> 
>   meta/classes/image.bbclass | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 276d0d31f4a5..a23403c0827a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -664,6 +664,13 @@ reproducible_final_image_task () {
>           find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
>       fi
>   }
> -IMAGE_PREPROCESS_COMMAND_append = " reproducible_final_image_task; "
> +
> +IMAGE_EXTRADEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
> +
> +systemd_preset_all () {
> +	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
> +}
> +
> +IMAGE_PREPROCESS_COMMAND_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd_preset_all;', '', d)} reproducible_final_image_task; "
>   
>   CVE_PRODUCT = ""
> 

In the interest of being able to produce a "stateless" system, I'd 
prefer to see us trying to empty out /etc at buildtime.  That will 
allows us to error out when things are being installed directly to /etc 
such that they won't be set up properly at runtime when the system is 
"stateless".  Allow things that _can_ be set up at runtime to be so; the 
runtime cost is small and paid only at first boot for stateful systems.

Calling preset-all at buildtime should only be necessary for read-only 
rootfs; even there, long term, /etc should be writable as that's what 
systemd (and others) expect.

/Jonas

