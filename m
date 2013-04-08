Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPJ8a-0007BI-KM
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 22:58:05 +0200
Received: by mail-oa0-f44.google.com with SMTP id h1so6724725oag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=MF5J7WHx6B6R3f5Y6vf3kKnWFou+aF+U9WGlmcRtqv0=;
	b=tX8z9yxzAco5Q/0Tu8c7zI78iQWvWgMWj7mW6yv5tUEhk2TZOJPG0bO2mvlv3ZkhR+
	VlbVXxrGoKDNMVf3T24oyy+NPuxpOrAIxznwIzg34q4M3XF3u+Q6VGo6ERaw6XXgD2bR
	DRNatARU3kL7o7cOqUMY5DuBmfVWeCUg9p3FeJN34UXb6ZP4GKEA5vEEhiWad42YYe18
	PkS84lVuai9jKM6Q9UVZpMhKf+oZfihmKl3tmrZyFHZvJ1n+eYz29VaXs+gOUCX9pU68
	iz/25JJ49dteEet6W1+xSZBJ/Z4DkevftbCT+sicKUDNdMT1VlS0Vy+ziVb5A4SxEupD
	ElGg==
MIME-Version: 1.0
X-Received: by 10.182.110.33 with SMTP id hx1mr16668656obb.32.1365453640369;
	Mon, 08 Apr 2013 13:40:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 8 Apr 2013 13:40:40 -0700 (PDT)
In-Reply-To: <25B01A83-A45B-4614-97B0-CB8E434CA168@dominion.thruhere.net>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<25B01A83-A45B-4614-97B0-CB8E434CA168@dominion.thruhere.net>
Date: Mon, 8 Apr 2013 17:40:40 -0300
X-Google-Sender-Auth: kujJXMWwgPNr6B8gWV0QKfqDlWA
Message-ID: <CAP9ODKpRz1VtMewDO92D2XdbZS5DF+s8pURJt6x=SmX8trKhdQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Mon, 08 Apr 2013 20:58:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 8, 2013 at 5:32 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 8 apr. 2013, om 18:29 heeft Radu Moisan <radu.moisan@intel.com> het volgende geschreven:
>
>> Along with v182 upgrade udevd was moved to ${base_libdir}
>
> By upstream, yes
>
>> making scripts like init-live.sh to fail in finding udevd
>
> So you should fix those scripts, not mess around with udev.
>
>> Fixes [Yocto #4046]
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>

This move has been done long time ago so I agree with Koen here: the
scripts needs to be fixed. Another thing, it should also be tested
with systemd feature enabled as udev will be called systemd-udevd in
this case, IIRC.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


