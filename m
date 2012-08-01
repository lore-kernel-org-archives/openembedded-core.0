Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SwfMJ-0005JI-7s
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 22:17:31 +0200
Received: by pbbrq2 with SMTP id rq2so1423960pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=8G73VaQiijT85vlS3SU6FxV1EoUqWMJvWn2M3XgcuRs=;
	b=sVkiR0uxhvRqs3E+OrXdeoqy65ONrWSqF421NofDBDkI7kSTnY4hXhmDAwET6nEzoe
	RzHtb+pHlif+vawvaUW6hCKMPcbQxhYc0mJyslfHIniBsXAUELuVoubq/wZMXTNwt01g
	/n/f5hVqMF8+JxtR/LTLh9mHHo+BS8XvlLGf3QRLEHd8ZOcWGf2eJeX/QigQSoE1K9ve
	S3vJRr1/r3uiGib3QhPv2vgJ1WOMldQB09pLroLtkSYn60opRosKlLX0y55lrtysA+DD
	d+swOk12sJbrMJ15A1HM586y1GJ6IAP+h9ZxxKvv1sfVL1SVkOUw5SFzBJcMeLsi1Toq
	7mmg==
MIME-Version: 1.0
Received: by 10.68.197.168 with SMTP id iv8mr54451136pbc.61.1343851551635;
	Wed, 01 Aug 2012 13:05:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Wed, 1 Aug 2012 13:05:51 -0700 (PDT)
In-Reply-To: <50197DFA.5070003@windriver.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com>
	<CAEsOVNfbJAqrDf-+DQh3h0pWtf-qDuQqKfC+_oBRHgyY4B6Obg@mail.gmail.com>
	<50197DFA.5070003@windriver.com>
Date: Wed, 1 Aug 2012 17:05:51 -0300
X-Google-Sender-Auth: bKT_2jpEkxGnXXmzWu9H0bwnXCM
Message-ID: <CAP9ODKobAsEeouwR+dA2tLNHBxDaxYSunwbbLMs5rV-ES5XfDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: static busybox?
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
X-List-Received-Date: Wed, 01 Aug 2012 20:17:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 1, 2012 at 4:05 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 8/1/12 1:59 PM, McClintock Matthew-B29882 wrote:
>> This is one approach, to change busybox completely for a specific
>> added layer. But, what if we only want to make this change to busybox
>> if the lxc recipe is included in the image? What about other packages
>> also requesting changes?
>
> There is no method within OE to change a configuration of one item, if
> another item is included or not.
>
> The way to do this is use the PACKAGECONFIG options, and then pass via a
> per-recipe configuration if you want lxc support enabled or not.. (or
> possible lxc becomes a distro flag?)

For lxc specific case I think we can just have a recipe that sets the
busybox' static option. It seems to be the only difference we'd have
for it.

Having compile options changing by other packages is going to be a
mess since we'll not know what to expect of build options of the
application/library (in this case busybox).



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


