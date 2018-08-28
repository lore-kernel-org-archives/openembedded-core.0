Return-Path: <marco.oman@innovatrieste.it>
Received: from mailserver.innovatrieste.it (mailserver.innovatrieste.com
	[147.123.5.60])
	by mail.openembedded.org (Postfix) with ESMTP id 46DA778DC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 12:29:23 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mailserver.innovatrieste.it (Postfix) with ESMTP id 448431E3804A;
	Tue, 28 Aug 2018 14:29:24 +0200 (CEST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mailserver.innovatrieste.it 448431E3804A
Authentication-Results: mailserver.innovatrieste.it;
	dmarc=fail (p=none dis=none)
	header.from=innovatrieste.it
Authentication-Results: mailserver.innovatrieste.it;
	spf=fail smtp.mailfrom=marco.oman@innovatrieste.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=innovatrieste.it;
	s=default; t=1535459364;
	bh=mBcgs+sejwoKtZbE6d8hQmMCQi+1WaUtGszW6zAuAyQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=I70i6IyVCYwd08EEWtn8/W1+i/jqC/CDSCJUMzRYlue3gq7bYxCGIGCNsJAS5c2M1
	KqXkde7Eu0MuVDV0FP7YAPK3ECEOaU5EGefVmV9u3uH9sOlGtep+YzBa6xx4XQQd9w
	KyxIID2Lku4Z/H9u6GG6zHNjRwrOhEQPEUOzJIc8=
X-Virus-Scanned: Mailserver - Amavis
Received: from mailserver.innovatrieste.it ([127.0.0.1])
	by localhost (mailserver.innovatrieste.it [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EPro9XFWo5Fr; Tue, 28 Aug 2018 14:29:22 +0200 (CEST)
Received: from [192.168.244.34] (unknown [192.168.244.34])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(Client CN "Marco Oman", Issuer "INNOVA S.p.A." (verified OK))
	by mailserver.innovatrieste.it (Postfix) with ESMTPSA id C05DB1E38047; 
	Tue, 28 Aug 2018 14:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=innovatrieste.it;
	s=default; t=1535459361;
	bh=mBcgs+sejwoKtZbE6d8hQmMCQi+1WaUtGszW6zAuAyQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Gek3ep2cchApx65KmT4SvCHbdsDFm7m8bV9P+rUx1Vs9RBs2TX4eq8nFn0S+4uMdG
	sk+HoICWXU0sEzxsnlk1rhFzk87Emdi7SPXIrcZyDkg2lgMl2MtukyO14YPwXA7kbU
	0LAdhPAJ91yc4x2e+1UuCZRyp6ecND+iFVHVWx4A=
To: OE-core <openembedded-core@lists.openembedded.org>
References: <2f3b7c17-9233-5159-59bb-73e6858eebca@innovatrieste.it>
	<CANNYZj_V1UfEQMWFJhbGy41+8j4rQWiCeZSA-Unpi=LDFzEyQQ@mail.gmail.com>
From: Marco Oman <marco.oman@innovatrieste.it>
Message-ID: <2b3b5c60-8c1a-325d-37cb-f29987f6737f@innovatrieste.it>
Date: Tue, 28 Aug 2018 14:29:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_V1UfEQMWFJhbGy41+8j4rQWiCeZSA-Unpi=LDFzEyQQ@mail.gmail.com>
Subject: Re: devtool recipe not working outside workspace
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
X-List-Received-Date: Tue, 28 Aug 2018 12:29:24 -0000
Content-Type: multipart/alternative;
	boundary="------------C8C3A813F7E0109A6FFEB4EE"
Content-Language: it-IT

--------------C8C3A813F7E0109A6FFEB4EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/08/2018 14:02, Alexander Kanavin wrote:
> 2018-08-28 13:44 GMT+02:00 Marco Oman via Openembedded-core
> <openembedded-core@lists.openembedded.org>:
>> So I gave the command
>>
>>   devtool add https://github.com/Unitech/pm2.git
>>
>> and then
>>
>> bitbake pm2
>>
>> Then added a patch. Everything is OK. At the end I moved the recipe under my
>> layer (sources/meta-mycompany/recipes-devtools/pm2)
>> and issued the command
>>
>> devtool reset pm2
> That's not how you should be using devtool. Once you are satisfied
> with the recipe and sources in devtool's workspace, issue 'devtool
> finish' instead of moving the recipe manually etc.
>
> Alex
>
That's from version 2.2 (morty), right?
  Any alternative option for version 2.1?


	


	
	


--------------C8C3A813F7E0109A6FFEB4EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 28/08/2018 14:02, Alexander Kanavin wrote:<br>
    <blockquote type="cite"
cite="mid:CANNYZj_V1UfEQMWFJhbGy41+8j4rQWiCeZSA-Unpi=LDFzEyQQ@mail.gmail.com">
      <pre wrap="">2018-08-28 13:44 GMT+02:00 Marco Oman via Openembedded-core
<a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>:
</pre>
      <blockquote type="cite">
        <pre wrap="">So I gave the command

 devtool add <a class="moz-txt-link-freetext" href="https://github.com/Unitech/pm2.git">https://github.com/Unitech/pm2.git</a>

and then

bitbake pm2

Then added a patch. Everything is OK. At the end I moved the recipe under my
layer (sources/meta-mycompany/recipes-devtools/pm2)
and issued the command

devtool reset pm2
</pre>
      </blockquote>
      <pre wrap="">
That's not how you should be using devtool. Once you are satisfied
with the recipe and sources in devtool's workspace, issue 'devtool
finish' instead of moving the recipe manually etc.

Alex

</pre>
    </blockquote>
    That's from version 2.2 (morty), right?<br>
     Any alternative option for version 2.1?<br>
    <br>
    <div class="moz-signature">
      <table cellspacing="0" cellpadding="0" width="640" border="0">
        <tbody>
          <tr>
            <td valign="top" width="180"><br>
            </td>
            <td colspan="2" valign="top" width="300"><br>
            </td>
          </tr>
          <tr>
            <td valign="top" width="180"><br>
            </td>
          </tr>
          <tr>
            <td valign="top" width="180"><br>
            </td>
            <td valign="top" width="90"><br>
            </td>
            <td valign="top" width="300"><br>
            </td>
          </tr>
          <tr>
            <td class="privacy" colspan="3" valign="top"><br>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </body>
</html>

--------------C8C3A813F7E0109A6FFEB4EE--
