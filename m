Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SxG6L-0000Fo-DH
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 13:31:29 +0200
Received: by vcbfy27 with SMTP id fy27so499935vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=w8jxpx3aKxBkdtAOjzybPNFNtpdbvcEpGHpK9ydFB94=;
	b=sc5UJ6VKFaMLzRl6TqZx82CsByqq3FRVemhojj5RbZKba4inzOBygD8+2iGnyxxMfg
	pqHGKi8bhqvH8pbzPP2i63xVK82c0xRDJKIn6E8h7L/A+NexjhNhN284LH1itAtr1ola
	AHNwd9z2PbfzkQMMH8AcngXSlcYNfiDtE0dCTLPyIu1B/rMvhuuJAhWc9hqusYlWFUe9
	H9nrnP/5wtyQwN3IODqY9mFHrD9YEdWe0P0dUmIGrly0YMIYspEW/BlZiF7YZvDQwSI4
	gdckNC+Zpwbk/EKBvLeYSHig3Ggj7W8+UhBnVlTucieWVJmejx+pf9w7ZK9E1U/83jed
	ol9w==
MIME-Version: 1.0
Received: by 10.220.107.198 with SMTP id c6mr988615vcp.54.1343992788177; Fri,
	03 Aug 2012 04:19:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.90.203 with HTTP; Fri, 3 Aug 2012 04:19:48 -0700 (PDT)
In-Reply-To: <CALRxmdCf1vZF21Ruxw_Bi7=uvbQ6-s3_rHU=LtVS19_hR+vvtQ@mail.gmail.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com>
	<CAEsOVNfbJAqrDf-+DQh3h0pWtf-qDuQqKfC+_oBRHgyY4B6Obg@mail.gmail.com>
	<50197DFA.5070003@windriver.com>
	<CAP9ODKobAsEeouwR+dA2tLNHBxDaxYSunwbbLMs5rV-ES5XfDg@mail.gmail.com>
	<CALRxmdCf1vZF21Ruxw_Bi7=uvbQ6-s3_rHU=LtVS19_hR+vvtQ@mail.gmail.com>
Date: Fri, 3 Aug 2012 08:19:48 -0300
X-Google-Sender-Auth: jX9TwpV9zS34Qkio3CFxwWg_Bao
Message-ID: <CAP9ODKpCdoe2G5q3Ly-qTYKvDsWNq6sypQq8QQ=dPO1=gRZSpA@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Aug 2012 11:31:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 2, 2012 at 7:50 PM, Stuart Yoder <b08248@gmail.com> wrote:
> On Wed, Aug 1, 2012 at 3:05 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Wed, Aug 1, 2012 at 4:05 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> On 8/1/12 1:59 PM, McClintock Matthew-B29882 wrote:
>>>> This is one approach, to change busybox completely for a specific
>>>> added layer. But, what if we only want to make this change to busybox
>>>> if the lxc recipe is included in the image? What about other packages
>>>> also requesting changes?
>>>
>>> There is no method within OE to change a configuration of one item, if
>>> another item is included or not.
>>>
>>> The way to do this is use the PACKAGECONFIG options, and then pass via a
>>> per-recipe configuration if you want lxc support enabled or not.. (or
>>> possible lxc becomes a distro flag?)
>>
>> For lxc specific case I think we can just have a recipe that sets the
>> busybox' static option. It seems to be the only difference we'd have
>> for it.
>
> Do you mean a distinct 'busybox-static' recipe that lxc would
> depend on?

Yes; it might include the regular busybox recipe and do the need
appends, or something like that.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


