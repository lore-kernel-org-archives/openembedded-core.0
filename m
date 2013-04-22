Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUIRy-0003V6-Mf
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 17:14:38 +0200
Received: by mail-vb0-f45.google.com with SMTP id w15so5915974vbf.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 07:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=B3qM13/NmR5CX6IPFiaZ9Va+ZYKwKDp8HGMY9Bi1Dwc=;
	b=Pb8a6T5fgKdflGBnimx+1sbeomNkzf/e+4VYcc6WsQLXHfupPzZh9mW3AwjvQDFyv+
	i/UXx5cuzKSw09ePfRM2OjuwI9n0/Hag+UZ3ZjZCXHJ/EGRPh6oy5CPnhoCnfyqsv1Kq
	fWNHuGoc8pbcUwgB4nGcE/yK1gQCcl2wCojh4K2srAHZoaLLRJT1yJqyfRKi2pJuUQAW
	x9LAew2+CGRb9LICYpHA/FPS576ycvLq2TunokpYsqb4zPCO7Etmxb2GyC5wLZjTmU93
	vLtC2FA1ZsLSxbB3H+XOk2qWjxPqLsgDvAki5NxYJan2GJqFdYebAETeog7rX8lqMvmF
	DuMQ==
X-Received: by 10.220.147.79 with SMTP id k15mr5221137vcv.38.1366642619324;
	Mon, 22 Apr 2013 07:56:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 22 Apr 2013 07:56:39 -0700 (PDT)
In-Reply-To: <51754CC4.9010604@communistcode.co.uk>
References: <51754581.3090005@communistcode.co.uk>
	<CAJTo0LYMc0F=OG-xUQztpveQdYAPKnj0W_8Vb-wRZRL7F5+bSQ@mail.gmail.com>
	<51754CC4.9010604@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Apr 2013 15:56:39 +0100
Message-ID: <CAJTo0LYRzgyvKMVpqY_AzgRe1h3UUcvaJm8g7Y0SPqZnq=9zSA@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQmNINVTg8sxbodV9t8BKcFn+2A5FMOZDXU2njQTTrLqlLCQ9/hp94NQ5kbXD9Bavh1ds3T2
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd post-install failure
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
X-List-Received-Date: Mon, 22 Apr 2013 15:14:39 -0000
Content-Type: text/plain; charset=UTF-8

On 22 April 2013 15:44, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Ah, ok then, I don't have a /system-update. So square one, any ideas why
> this would have suddenly flagged up? I was building and booting fine on
> Wed/Thurs. That was the only useful bit of the debug log I could
> determine...

That log isn't massively useful, can you explain exactly what isn't working?

Ross


