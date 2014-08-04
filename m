Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5DC617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 20:16:43 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id c41so4648182yho.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=SJqtNLKv1wv/tTn/YBiunBojt6ebbV52kNcRxWnaFLg=;
	b=0/TJhtwmIAFZ/7Ud5jh6JGFvfqdgVjhavZ9rO0vJO/a+884HNm3/q6b5dKAlq9mIzg
	pMLuqsMgQcxoYr9wRE8N7i/KA7aAjIoGf4r4PPAmpy+kgjpONl5xaIGzbfKtwh1/+b0i
	zgEH8CPn5W5alqw4NpPMpCMGKANQlDThhyBPlhX1swa9k2jv7eKiUbNIN9qZPH/VbJTL
	o42erUSu9VbKryrEdJ4nCCfBeBbpdn6ww5Q95wuOTydUAJNAOR/7RiEys3wXPd+ag+Uo
	qyXLjfgiqDs4fceLvlP7gZWdx8QMnLhELWTe7Whuck1q0kO7ukldBjmaBkl98Rds/vCi
	89ow==
MIME-Version: 1.0
X-Received: by 10.236.103.135 with SMTP id f7mr41649231yhg.102.1407183405248; 
	Mon, 04 Aug 2014 13:16:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 13:16:45 -0700 (PDT)
In-Reply-To: <53DC39DE.5020105@pabigot.com>
References: <53C3A130.4000900@pabigot.com>
	<53DC39DE.5020105@pabigot.com>
Date: Mon, 4 Aug 2014 17:16:45 -0300
X-Google-Sender-Auth: OUJAAj7e6ByCdL0Cfo52SfTxw4g
Message-ID: <CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Peter A. Bigot" <pab@pabigot.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchwork client problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Aug 2014 20:16:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 1, 2014 at 10:07 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> On 07/14/2014 04:21 AM, Peter A. Bigot wrote:
>>
>> I'm finding attempts to use pwclient on
>> http://patches.openembedded.org/xmlrpc/ produce an ExpatError because the
>> returned document is always empty (per a wireshark trace of the
>> transaction).  Can somebody confirm that the server for the command-line
>> client is working properly?  Thanks.
>>
>> Peter
>>
>
> I've downloaded a fresh copy of pwclient from
> http://patches.openembedded.org/help/pwclient/
>
> I've verified my .pwclientrc is exactly what the project info tells me it
> should be:
>
> [base]
> url: http://patches.openembedded.org/xmlrpc/
> project: oe-core
>
> I've verified that pwclient works with other servers.
>
> And I still get empty documents back from the OE patchwork server for every
> pwclient command I try.
>
> Anybody have any idea what's going wrong?
>
> Thanks.
>
> Peter
>
> llc[40]$ /tmp/pwclient projects
> Traceback (most recent call last):
>   File "/tmp/pwclient", line 500, in <module>
>     main()
>   File "/tmp/pwclient", line 439, in main
>     action_projects(rpc)
>   File "/tmp/pwclient", line 213, in action_projects
>     projects = rpc.project_list("", 0)
>   File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
>     return self.__send(self.__name, args)
>   File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
>     verbose=self.__verbose
>   File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
>     return self.single_request(host, handler, request_body, verbose)
>   File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
>     return self.parse_response(response)
>   File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in parse_response
>     p.close()
>   File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
>     self._parser.Parse("", 1) # end of data
> xml.parsers.expat.ExpatError: no element found: line 1, column 0

I have same error; I am adding Khem who I know has access to the
server and can know more about it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

