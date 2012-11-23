Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TbiV0-0000UW-KZ
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 02:56:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAN1fvMw008962
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Nov 2012 17:41:57 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 22 Nov 2012 17:41:57 -0800
Message-ID: <50AED492.4000101@windriver.com>
Date: Fri, 23 Nov 2012 09:42:42 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1353553772.git.kai.kang@windriver.com>
	<109a6ebf14ab5d312954f371eaf3bbfbcb6fb2d0.1353553774.git.kai.kang@windriver.com>
	<CAP9ODKpd5BQDEn8tigirfCkA0ejfW6-Sd4HdWnwDe8Vrj5s4nQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpd5BQDEn8tigirfCkA0ejfW6-Sd4HdWnwDe8Vrj5s4nQ@mail.gmail.com>
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] lsb: move links from lsbsetup to here
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
X-List-Received-Date: Fri, 23 Nov 2012 01:56:11 -0000
Content-Type: multipart/alternative;
	boundary="------------020009000804080309030801"

--------------020009000804080309030801
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2012?11?22? 18:37, Otavio Salvador wrote:
> On Thu, Nov 22, 2012 at 1:25 AM, Kang Kai<kai.kang@windriver.com>  wrote:
>> Because package lsbsetup is dropped, move the links created for LSB test
>> to package lsb.
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> This ought to be done before of dropping lsbsetup too.
>

Hi Otavio,

Thanks a lot for your comments.

About the patch of packagegroup-core-lsb, I agree with you that lsbsetup 
should be removed from the list before drop the package.

But for this patch, if do links before drop the lsbsetup, when do 
install it may warn something like 'there already a file 
${D}/${libdir}/lsb/install_initd'.

Regards,
Kai


--------------020009000804080309030801
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 2012&#24180;11&#26376;22&#26085; 18:37, Otavio Salvador wrote:
    <blockquote
cite="mid:CAP9ODKpd5BQDEn8tigirfCkA0ejfW6-Sd4HdWnwDe8Vrj5s4nQ@mail.gmail.com"
      type="cite">
      <pre wrap="">On Thu, Nov 22, 2012 at 1:25 AM, Kang Kai <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Because package lsbsetup is dropped, move the links created for LSB test
to package lsb.

Signed-off-by: Kang Kai <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
This ought to be done before of dropping lsbsetup too.

</pre>
    </blockquote>
    <font size="+1"><br>
      Hi </font>Otavio,<br>
    <br>
    Thanks a lot for your comments.<br>
    <br>
    About the patch of packagegroup-core-lsb, I agree with you that
    lsbsetup should be removed from the list before drop the package.<br>
    <br>
    But for this patch, if do links before drop the lsbsetup, when do
    install it may warn something like 'there already a file
    ${D}/${libdir}/lsb/install_initd'.<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
  </body>
</html>

--------------020009000804080309030801--
