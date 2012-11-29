Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Te1u3-0005dw-Mc
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 12:03:41 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so7930992pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 02:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=60jF1Pi4XjURqFt7/1RKiIleL6NAQ6xbehBYbtb4ZRs=;
	b=B0otrYjI0KTu1wGHHQhC9rhClZQvMv1b4D2+gwCdfJYmE1kiXNUgvw0WU3K0Z2yv39
	4eXpO8JOzoKizZKc7FDsJiFqX24KB0iGpkynKS6ZvLMWW6HJavHTgfwEWtSqj7EYwwFW
	reWVHPcRe0eMB6WLkg4z/7hbdAA5WpGgVjbCLFXR47AaA4sKP7BCSNAsn0d2hVZzVIto
	WoAJenNqHdaNydgk1taH94pwM4w4Ehyh9hWpiIV9LU+KVGRQfoKeoKXTA+SWNjuu8P8d
	D4s5ssj4KhftLPVrjHVHZiIARFZkrd0IB4EDSdyB5GUOGwC/8tnzI7WHPSQ+OIHkFOWN
	l2Mw==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr68299527pbc.24.1354186159263; Thu,
	29 Nov 2012 02:49:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 29 Nov 2012 02:49:19 -0800 (PST)
In-Reply-To: <50B72A4E.4010107@windriver.com>
References: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
	<50B5763B.1040107@windriver.com>
	<CAP9ODKpyi3Hs1B8C9OovatGG2VxukWU9pdip2HMTMFjJn9FSJQ@mail.gmail.com>
	<A8A2F4C5E3D3D0468DDA3544476725F85BC7EE51@EU-MBX-04.mgc.mentorg.com>
	<50B72A4E.4010107@windriver.com>
Date: Thu, 29 Nov 2012 08:49:19 -0200
X-Google-Sender-Auth: SeWcxH6LaOEcQXQmS6CawxnvFMQ
Message-ID: <CAP9ODKoKcuRhPyZVAnAfMkyguW4RDY=g=7vVh0qRx=QYcXjpfQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
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
X-List-Received-Date: Thu, 29 Nov 2012 11:03:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 29, 2012 at 7:26 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> So the question would be:
> Is it reasonable to always intall udev under /lib?
>
> udev's user manual seems to imply this behavior.

I think so.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


