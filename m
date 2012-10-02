Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJ37S-0002lA-Ar
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 16:06:42 +0200
Received: by padfa11 with SMTP id fa11so5299536pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=SDEt3LgkEK0rxX8+R5U4lFIW1EXNWWv5G3pUpk2YMIc=;
	b=RKLUcmir6qhXqjPU3cOmnX06JAGcU/tnEmLfzLarzDFWNQOscP4FJQbq5mCZbxQu/U
	gcprW1uZJdOm9+p7b/KOcuKEJF+oVQ/Cj/K+1ZsGnSKq0spMouWR+5tZnCdrKQa3yXFn
	FUa/3t4iQ6m2fBU3NEyZD1S2k7HYEL9b8vQTwib4d4hXR/ZBhUhvmQikAM+yInqI7tVG
	8cD3NbmeYiVnXoEkEi/ozXy9WKVlCv7/h0Dm0TPvEITZg13a7eMcUfkgVrfYUzajsFXZ
	NrkVtMhXcpqSZkge0iO6UBaT28Gw+oBWoCHILLSf6AgoQAvTpx9KpebIbVRB9NVUs59L
	gT+Q==
MIME-Version: 1.0
Received: by 10.66.87.133 with SMTP id ay5mr43990453pab.59.1349186023221; Tue,
	02 Oct 2012 06:53:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Tue, 2 Oct 2012 06:53:43 -0700 (PDT)
In-Reply-To: <1349185900.32611.88.camel@phil-desktop>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<CAP9ODKqk-xe4vgx1aLJKgnceBU5Ds3RGKCZYkEo3sCKc4OGZaQ@mail.gmail.com>
	<1349185900.32611.88.camel@phil-desktop>
Date: Tue, 2 Oct 2012 10:53:43 -0300
X-Google-Sender-Auth: 7U-1axAtYWA3MACBJd4xjlVGKiM
Message-ID: <CAP9ODKp3H99BCS3k0K890Eb6xtM2_8Toph4T2=Q1yNvZK5XeLQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Tue, 02 Oct 2012 14:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 2, 2012 at 10:51 AM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2012-10-02 at 10:42 -0300, Otavio Salvador wrote:
>> Or IMAGE_FEATURES += "dbg-img" ;-)
>
> Where is that implemented?  I couldn't find any obvious reference to
> dbg-img in any classes.

Sorry by cause a missunderstanding ... I was just pointing to a
possible new feature you could add.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


