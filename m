Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0xXw-0005aq-4K
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 18:03:33 +0100
Received: from mail-ye0-f199.google.com ([209.85.213.199])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2013 08:47:47 -0800
Received: by mail-ye0-f199.google.com with SMTP id l12so4026538yen.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 08:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=vxCEfw9OC4XeETCJSS9bAKuyXRGBMJggBQTY7awx5O8=;
	b=Ug6MKGUJjDU9zTJ6fi1Pvx8eOTiHWgAe8UQCTv6ivDjH+9/vs3nWT1mtB+jxf4Duuo
	Mhkeik5oawmqL69X1LGufhiilTusPcxFE9kLOtHuap4/iSvyxXMC0azQdBFJj9UDJw4j
	zPMsHs1PhFB2P8k9Wcy3JNwqP76FcN2KjqjBrQPAGhhTBUAK7wHb38IV7x0AMQSNqpiK
	PRal4t0owvtw6XZJVcv0bwC++ZlYIy3qoOyiZHWxEoTfe1C38z/9lBcUMeXSYZfR5yNi
	EOXpJ/nBlFVM0Er/NFpQjS9iwZMbqAKIIMIyi8QXijBjJ95zzZraslzn98vFeJjA45Xv
	wAhA==
X-Received: by 10.220.214.6 with SMTP id gy6mr6224915vcb.8.1359650866742;
	Thu, 31 Jan 2013 08:47:46 -0800 (PST)
X-Received: by 10.220.214.6 with SMTP id gy6mr6224908vcb.8.1359650866658; Thu,
	31 Jan 2013 08:47:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Thu, 31 Jan 2013 08:47:26 -0800 (PST)
In-Reply-To: <1359631839-12941-1-git-send-email-igeiser@devonit.com>
References: <1359631839-12941-1-git-send-email-igeiser@devonit.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Jan 2013 16:47:26 +0000
Message-ID: <CAJTo0LYJmGDPAc9su3mtejeA6iTkszjju=VTLrwyTzs9oz8Pbg@mail.gmail.com>
To: igeiser@devonit.com
X-Gm-Message-State: ALoCoQlksV8bipbzbWHQ0NS98WTcCDNv4Cm/Fxq/eDfs8aKW1B4aRYpalmoGdSvZCpdOaxXgfAwtZIBJQdyASB6ieLO6318pFjfkH8xCwgZ19aQeLNsZZfp8oZYvPqT9LgSDRIoNIIcQyryQ9crXQPDE9UjQvrz78C7nRVnDIo0cOVUJyA5q9usG4rQLZZiDlwsskBLvuJwF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] mesa-dri: add extra dri drivers
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
X-List-Received-Date: Thu, 31 Jan 2013 17:03:34 -0000
Content-Type: text/plain; charset=UTF-8

On 31 January 2013 11:30,  <igeiser@devonit.com> wrote:
>  * For x86 and x86-64 clear out the field so mesa
>    enabled all of the modules.

I really prefer recipes that specify what they are doing, so please
list all the drivers.  If it autodetects we might regress in libdrm
and drop a driver, and not notice because Mesa was silently handling
it.

Ross


