Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRJv6-0001TQ-LQ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 11:40:08 +0200
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 25 Oct 2012 02:26:38 -0700
Received: by mail-ie0-f197.google.com with SMTP id 9so3986186iec.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2012 02:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=yFljkNfykjWmFOyF61lJA/ozcd6sLxXHK40qxee+hLI=;
	b=BmgXqGennyBhfraP6lQRINwR7BCBajmfQxYUaeRvYr2GJRXBEI1BMDWaOpIzoSSUcT
	jc+o3Gyox9+6FmZO70DWqt0ocENG4GN+iTRAVa4WWW/QeZiIWgiSujOwz3ffNXrWa4BJ
	Qfo8keFMg2M0cHuaQ7oR3PuOt24K842DstAgzq6S9sI92Y0dgApqCmxUCiQTwrBhsGE3
	2qME2POGXiyDrEOigjzLZv9u2b7DUnLv5F6fmbJxVxKhEI6nF1j17s9eVdN0HMIpV6YS
	RSBffuPp3DntRREwsFx36H3wc/aht+fsHkC7P+qj0ysNpjVoiC7Ce9QR4TB7QXhfBtf0
	U+bQ==
Received: by 10.182.0.1 with SMTP id 1mr14972261oba.18.1351157197137;
	Thu, 25 Oct 2012 02:26:37 -0700 (PDT)
Received: by 10.182.0.1 with SMTP id 1mr14972258oba.18.1351157197048; Thu, 25
	Oct 2012 02:26:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Thu, 25 Oct 2012 02:26:16 -0700 (PDT)
In-Reply-To: <20121025040826.GG3465@denix.org>
References: <1313164784.6733.165.camel@phil-desktop>
	<20121025040826.GG3465@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Oct 2012 10:26:16 +0100
Message-ID: <CAJTo0LYPBqegO+q6py0mzO1_rQ5hrpoy031d0t=x_2Rn6Fq+ZQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQlk7K26MaunFL1YOybrgkmo9hcq6NRNzdk6iDAC96IOreuPNdOBKoZFM5UstgY9g8Bg/Cj8codVTFeQNEZGXnIuV/8G8CDsTEb7/PB68u69NP0EVNZ1vli84A/DNtuL9nyOpSuOjGkDI5Me8DuCSDy6l4QaNdkQtgzV8Z7xQ9LjIYbJhOf339bjGEYlzJ6qJ0v6bbZl
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: dbus: only use x11 if DISTRO_FEATURES has selected it
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
X-List-Received-Date: Thu, 25 Oct 2012 09:40:08 -0000
Content-Type: text/plain; charset=UTF-8

On 25 October 2012 05:08, Denys Dmytriyenko <denis@denix.org> wrote:
>> -DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
>> +X11DEPENDS = "virtual/libx11 libsm"
>> +DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>>  DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
>>  DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
>
> Would there be any objections extending this DISTRO check to nativesdk as
> well?

Makes sense for nativesdk I guess. Tested patches welcome!

Ross


