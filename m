Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPbmP-0001bx-KF
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:52:22 +0200
Received: by mail-oa0-f50.google.com with SMTP id n1so7732356oag.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Ep7WKJ3xAviA9zh2Z3uh1hxmkfNl7w5h4CixsA8r6w0=;
	b=ga2IQGZ22k1iOP9yPvStv70LmJU5sGiZMyn89IMhlMRAFOpZamJkfb9jEwsinCNqV+
	a8iDh+ND6BKMHT9o0bzBy4sLNyBm9shKlQNVqjtps8GCgoI/ctUxudJkjlAoJWC/ZWW1
	8DLy0udmejxfv3GdE+GzG+xmLskRgqMH1IFZZttmCTzQqyh1+ysdJV2tsAUpouvadB9n
	QsLKaZpsb5lQpQZD5yQH3hxlW50gSO8OAICbs6L+uAKDP3hn/zO8tBV4sPrxLFd2Ef6h
	kFgPnR62nKJw1OJa1VLBxln8Oz1D7UWE4HMX55e+NS99ocQ2xYRbWj3vJnocxXxMUhp0
	Deiw==
MIME-Version: 1.0
X-Received: by 10.182.125.132 with SMTP id mq4mr7351086obb.79.1365525300867;
	Tue, 09 Apr 2013 09:35:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 09:35:00 -0700 (PDT)
In-Reply-To: <51643CAF.4070407@linux.intel.com>
References: <1365523119-27605-1-git-send-email-alexandru.damian@intel.com>
	<51643CAF.4070407@linux.intel.com>
Date: Tue, 9 Apr 2013 13:35:00 -0300
X-Google-Sender-Auth: E54t0RKGAW7Hn4EGpEUPC09QzMo
Message-ID: <CAP9ODKq9qBVe2zQrmw_a2nK8ApPDDxZ3BS1y0k+g4GKkvgG90Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Alex DAMIAN <alexandru.damian@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: changed location of udevd to /sbin/udev/udevd
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
X-List-Received-Date: Tue, 09 Apr 2013 16:52:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 1:07 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 04/09/2013 08:58 AM, Alex DAMIAN wrote:
>>
>> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>>
>> This ammends the init script after changing the location from
>> /lib to /sbin.
>>
> This only fixes one location and does not make it dynamic, I will have a
> patch shortly to fix this.

Your fix does not make it dynamic but staticly set at build time.
Please iterate over the possible alternatives, as I did in
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/initrdscripts?id=1b99640481882d23dc3ded41d9f2aef906f77e67

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


