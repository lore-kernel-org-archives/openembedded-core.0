Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TQI8g-0001NG-E3
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 15:33:54 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so799840bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 06:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=6XRDEP6Et7q7r3z7l++2phgPwmlkC02Cf4edgNwMz+Y=;
	b=jv26PbA8p3hIoOMKO7n9NAuRaspkZhQGHek77unnLfMv4u0fbLofKSLz56vx4x1a50
	EyMYpsFR/NDNTro/ikrFW6CbGMDppjcr8yJ/ZEouveDgZeF+fPs6dznKsxi6lwhVyKO2
	PnvSkA7dOEgqHhkxJg3/TgcS3tvcxRjawDhntkI0CqOngHQARwPJrBY5karhkYLO6JUg
	rO08vPjznF1y5ECmLPN5RtG4KrtLw4l7LGhUTEATe+f6esR7V1RkiM6LkfvdAnTX2KHy
	eS4IWYp3nE9KBUT538dxQ1BOTWcUqSuFU3QkiLd6hPkPzKoUkndLNGnEdm7+DUAT2Ztd
	kxDw==
Received: by 10.204.147.148 with SMTP id l20mr2610239bkv.112.1350912029654;
	Mon, 22 Oct 2012 06:20:29 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPS id j24sm3588998bkv.0.2012.10.22.06.20.28
	(version=SSLv3 cipher=OTHER); Mon, 22 Oct 2012 06:20:28 -0700 (PDT)
Message-ID: <5085481A.5050909@dresearch-fe.de>
Date: Mon, 22 Oct 2012 15:20:26 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
References: <50854312.5040502@dresearch-fe.de>
	<CAGiJk9dt0OTOMG5T7DoomCfXxp+FUw15PWTXnaCSm=BJOpfjnw@mail.gmail.com>
In-Reply-To: <CAGiJk9dt0OTOMG5T7DoomCfXxp+FUw15PWTXnaCSm=BJOpfjnw@mail.gmail.com>
X-Enigmail-Version: 1.4.5
X-Gm-Message-State: ALoCoQldXJXEQ8U6knzX/nPA8FlxffxUcBYZlds7drgAi5RLf8iqniTDkBalOhST00roYtjJZUKR
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Profiling binaries?
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
X-List-Received-Date: Mon, 22 Oct 2012 13:33:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.10.2012 15:12, Samuel Stirtzel wrote:
> 2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
>> Just a short question: Does oe[-core] provide a generic method to create packages containing binaries/libraries with profiling support?
>>
> 
> Depending on your platform you could use Valgrind [1], or to be more
> specific Callgrind [2].
> 
> The recipe is in .../openembedded-core/meta/recipes-devtools/valgrind/
> you can check there if your arch/platform is supported.
> 
> [1] http://valgrind.org/
> [2] http://valgrind.org/docs/manual/cl-manual.html

My question was more related to gcc -pg, gprof & Co.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


