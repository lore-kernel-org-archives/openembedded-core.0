Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsHva-0005Yn-EP
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 20:27:50 +0200
Received: by pbbrq2 with SMTP id rq2so5831435pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=43TE/Jcj8K8r75fHTuSQ3IhoTKNuhHl5uVpxAagxJdE=;
	b=TtDECNETk0R7nU6pyil7XBQVePsxA+3YxyO1n2yLRJjG9GeFh8+ac1aw9zonaHssIt
	1Z2ul1iD6P0fY1cDBF2QUZFPOTrI9f6N13B1sGoGEJ0NJIO07tfsNji3TftucBk/VnUg
	l5jIJPNAdDkmeSIhoiKFQTrfnrnzWoqJAPWOlM82wo20OZlmLpYcdmyCwHP09Wz/YlSl
	BZSEREO0gkMnyHSbR71rOrJpFH+lPSDnMSGuAilQsnDMx/gz+IHwggk7bPScO9xKSPtW
	P+/qhA+qUsts15MSMLAYH+ijK1eIeV+DWSMHnf2j8hlyhpon7g3a8HKbFmlx5kU1TkGK
	lFNw==
MIME-Version: 1.0
Received: by 10.68.129.168 with SMTP id nx8mr15711193pbb.112.1342808186071;
	Fri, 20 Jul 2012 11:16:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Fri, 20 Jul 2012 11:16:26 -0700 (PDT)
In-Reply-To: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
References: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
Date: Fri, 20 Jul 2012 15:16:26 -0300
X-Google-Sender-Auth: 43kO05v1PKF30lwX015vZxUSqNc
Message-ID: <CAP9ODKoxif5tj9mZR4opLJ4H=y0BqV+TSq8kFxx4KvxwjxxbPg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] shadow-native: use 'users' group by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 18:27:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 20, 2012 at 3:13 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This would be nice to be included in next denzil.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


