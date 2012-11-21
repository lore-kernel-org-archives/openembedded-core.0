Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tb8fe-0005ER-JD
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 12:40:46 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3226493pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=3CNZ9hSYYHc1HN8fy863tJU2D33rOG0rABzMSnGbBt8=;
	b=fHup8EurdC2bM8+9B1P3R9JLvBCJWdj5lYX/pGBjpmwziM4ApsfKRqxTSgLnp+Nsyn
	o//Mwa7B+HZCvPzovA+eVuUJ0VQCbJgLMY/1f02ToKWPM8uJwOgCfrOcN/RUzwmYY3Cz
	STvieDHzEBKtuC7B3es6x7GiETac8N6YkQcyiNaqSQKbjdStNMf0HWWAXw/ilQ2UBGcC
	ikTW9WFcuULs1Xmpxeer3Dm9Pi/7NzCF8TpYotmrPQ52M1l8ckj26t3wKz16a8qkxVvr
	cVYXcPmy9E5HzRLdnKT1oxIRGxMyakLV7IgRFUvJbK5TDY1pMefqnJj/LRsyCoklV6Hp
	3S4w==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr57344968pbc.130.1353497201098; Wed,
	21 Nov 2012 03:26:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 21 Nov 2012 03:26:41 -0800 (PST)
In-Reply-To: <CAPhnLPAx0bgPRk-YT3uWLfETOhE9ECu0Akxv5i8UGDU+L3-hKg@mail.gmail.com>
References: <CAPhnLPAx0bgPRk-YT3uWLfETOhE9ECu0Akxv5i8UGDU+L3-hKg@mail.gmail.com>
Date: Wed, 21 Nov 2012 09:26:41 -0200
X-Google-Sender-Auth: Fy6CLFAt6UbG8g8Zv9PeBCi4X2I
Message-ID: <CAP9ODKo1RqiYCgUgt+Xd6Hf7PyPw+mPsCwxRxt=NpAyAYy0PXg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] license.bbclass: Collect LICENSE level packages
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
X-List-Received-Date: Wed, 21 Nov 2012 11:40:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 20, 2012 at 7:49 PM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> Some bad logic in license.bbclass misses certain package level
> LICENSEs.
>
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

Does it also affects Danny?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


