Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjWvD-0001gS-Nh
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 15:34:43 +0200
Received: by iyj12 with SMTP id 12so198306iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=kG70wcpVTeVFmUU6G03iF3ZFPuipFMS0bDQO9tOFf0Y=;
	b=Q/RaA0XWylz+nBusf06j8xw/6lasLvboLg0Zvx8OVwhzIt4jdFTuZ0R2EzNA6k/VWb
	eg/iRzLMbXvOOHhV6PnsHDNFL2lEUVlhlDyOylyHDnIssvclFDDK8E21+rsE8vGr4L6g
	cDlCkzCRty2aDGSHMda5b2FqWcJVUCI9UxcSk=
Received: by 10.231.114.208 with SMTP id f16mr347163ibq.158.1311168636787;
	Wed, 20 Jul 2011 06:30:36 -0700 (PDT)
Received: from [172.23.10.146] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id q13sm168449ibi.43.2011.07.20.06.30.35
	(version=SSLv3 cipher=OTHER); Wed, 20 Jul 2011 06:30:36 -0700 (PDT)
Message-ID: <4E26D87A.5020808@gmail.com>
Date: Wed, 20 Jul 2011 06:30:34 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1311154909.30326.51.camel@phil-desktop>
	<CACW_hTYXboQ+Zzkt3PXBuA_=uMDVovTgt7g7BNJSxbCdjuoS2A@mail.gmail.com>
In-Reply-To: <CACW_hTYXboQ+Zzkt3PXBuA_=uMDVovTgt7g7BNJSxbCdjuoS2A@mail.gmail.com>
Subject: Re: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 13:34:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 04:55 AM, Frans Meulenbroeks wrote:
> 2011/7/20 Phil Blundell<philb@gnu.org>
>
>> Since updating this morning I'm getting
>>
>> | ERROR: Function 'File: '/home/pb/sources/libiconv-1.13.1.tar.gz' has
>> md5 checksum 7ab33ebd26687c744a37264a330bbe9a when
>> d42b97f6ef5dd0ba4469d520ed732fed was expected (from URL:
>> 'ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz')' failed
>> NOTE: package libiconv-1.13.1-r0: task do_fetch: Failed
>>
>> The offending commit appears to be
>> bd1e627bef29830f9346b4b984905fd8fcf2e716.  As far as I can tell from a
>> quick inspection of the files, the checksum that was added for
>> libiconv-1.13.1.tar.gz in that commit is actually the md5sum of the
>> earlier version 1.11.1.
>>
>> This seems to indicate that the added 1.13.1 recipe has not been build by
> neither the submitter nor the committer (let alone tested by someone).
> is that the kind of quality we want to achieve in oe-core ?
>

there is already patch sent to fix it.
http://patches.openembedded.org/patch/7933/
libiconv is not default provider of virtual/libiconv on eglibc/glibc 
based systems and sometimes that can trip you over. It happens and as 
long as we find it and fix it quickly I don't see a problem. Do you ?

IMO we should not get so pedantic that people start getting scared of 
making changes

> Frans.
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



