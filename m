Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Ts3HA-0003j9-Dt
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 04:21:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0736C1r010333
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Jan 2013 19:06:13 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 6 Jan 2013 19:06:11 -0800
Message-ID: <50EA3BB5.7080103@windriver.com>
Date: Mon, 7 Jan 2013 11:06:29 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
	<c8df96d897ecdf4fe04088aff1eba2fbfb0c004a.1357465230.git.Qi.Chen@windriver.com>
	<CAP9ODKpQUQmBOnWHRBEcF6k3aK=-bqM0=9m+bi8DxXC7gsHzSw@mail.gmail.com>
In-Reply-To: <CAP9ODKpQUQmBOnWHRBEcF6k3aK=-bqM0=9m+bi8DxXC7gsHzSw@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V6 6/6] core-image-sato: support read-only rootfs
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
X-List-Received-Date: Mon, 07 Jan 2013 03:21:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 03:05 AM, Otavio Salvador wrote:
> On Sun, Jan 6, 2013 at 7:44 AM,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Support read-only rootfs by providing a specific conf file for volatile storage.
>>
>> [YOCTO #3406]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> I prefer this solution than the previous one however why you don't use
> a sato-volatile-conf package to provide this?
Because the there exists a one-to-one (or almost one-to-one) 
correspondence between the volatile conf file and the specific image.

If there is a 'sato-volatile-conf' package, then there should be a 
'minimal-volatile-conf', and maybe a 'custom-volatile-conf' if users are 
using a customized image.

So I think it's simpler to let the image recipe provide the conf file.
The only thing we have to do, when adding read-only rootfs support to 
some image, is to add the conf file to SRC_URI and install it in 
choose_volatile_conf.

Kind Regards,
Chen Qi
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
>



