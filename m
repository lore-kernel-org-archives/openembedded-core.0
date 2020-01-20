Return-Path: <pascal.huerst@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 84CFE7FC4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:17:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id b19so13608730wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 01:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QNCFs5TZf5/NkrGWx1QQn06rM6SJIrnf4rMpn0ilquQ=;
	b=X83VR9Qlv7t35OeAHfdZJ/TL+gMQ+ZzKVXudRMklymQj//fVAp89J0QQ8s6XxWoUC1
	v51ppRNhm+2cLLVtjWZVWp3wKsKmhJ7373G6bb3u6PkJUbfmJzpOGOkEB8GjDSviMVle
	JsexVrJKi27Dmvj5dM1AwdT6Fg14tiHtbFLCizc5YdTeNOGc466xd7IOFh7XQpitaGxT
	/Ona2DRRuV0T6+NiSbmp3XpLBbhtW5qBNmyd6TueqVb9e6PPZWCcKyX/53J4VH1i00my
	npy3u+5TpHNLmvEcXOYTJ1Ky4VME+VIlCagnmGXK6Eq0RXHbx/ji/dkTIkSmyJ2b/KGF
	nMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QNCFs5TZf5/NkrGWx1QQn06rM6SJIrnf4rMpn0ilquQ=;
	b=ZYhwXjDFS4tUL4smRsvmFeUavSwECwMmIhIzPKVkik4lFGhQzbhfoiMgdBA1ZvzMcO
	vOtpXDIicmAv4cG0MibOALaT8yLLsR/v6cCQiwKGXlM0o7yj2gE3GbJS/cYNSE78YyxW
	gUu7RJmOcUuW1fsjK3Xn6l+YeZsoVnZS57xlsFV9Rgw/seR5MDVzc1xfr3XzJhmVJRAv
	J7czzu4wZP0wx2Pfz7P4NlSsetTXS+SC2pcM92e961qES/47iXN0n6OrTzfKmCEiieVH
	hyRl55pBJ52S+59j71L4zNkAj0zwti2gAB3jmutdR8m4+dN5Xmble0OeyZPgK5EqT9fs
	YKLQ==
X-Gm-Message-State: APjAAAXi284bt5XIjY+zQsKVD71frh917MiduVCEUOXniaBPEFiQd6KV
	RxBcG71PX4CHrgxmgrh53ek=
X-Google-Smtp-Source: APXvYqzKaNBIHNwW3xjVgAPk7jyVZ9W5yeA8W9fk1kCS9W8n+GaR4FcQTdHtCNxD3EZXcsuomlDXbg==
X-Received: by 2002:a7b:cd87:: with SMTP id y7mr18964549wmj.189.1579511861224; 
	Mon, 20 Jan 2020 01:17:41 -0800 (PST)
Received: from [10.10.222.52] ([194.162.236.226])
	by smtp.googlemail.com with ESMTPSA id
	x6sm21563892wmi.44.2020.01.20.01.17.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 01:17:40 -0800 (PST)
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
	<CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB16537AE4F18230211893EAFB8B370@CY4PR12MB1653.namprd12.prod.outlook.com>
	<5635f310-c6a0-1f4a-9fb9-05ac4813fdc1@gmail.com>
	<CY4PR12MB1653056C46459CD414FA9C578B360@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB165360D26B46F6A7220313238B360@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB1653BEA34A6F214D78FA27138B300@CY4PR12MB1653.namprd12.prod.outlook.com>
From: Pascal Huerst <pascal.huerst@gmail.com>
Autocrypt: addr=pascal.huerst@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e8c4b3e9-a861-0467-fb50-d8f675435c13@gmail.com>
Date: Mon, 20 Jan 2020 10:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CY4PR12MB1653BEA34A6F214D78FA27138B300@CY4PR12MB1653.namprd12.prod.outlook.com>
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Mon, 20 Jan 2020 09:17:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18/01/2020 02:11, chris.laplante@agilent.com wrote:
>> Cross the first TODO off the list:
>> https://gist.github.com/mostthingsweb/39e24b329de70c0212e5bf21a431e143/8d1a5f51b3c0bf260c730ed5716d9807c78335b8
>>
>> (BTW eventually I will move this to poky-contrib; gist is just more convenient for me for the short term. If there's a desire for it to
>> happen sooner let me know.)
> 
> revrecord.bbclass has been moved to the cpl/revrecord branch of poky-contrib.  
> 
> I have added the ability to capture the branch for git repositories. Please check it out.

Hey Chris,

thanks a lot for sharing. I will give it a try as soon as I have some time!

Regards
Pascal

