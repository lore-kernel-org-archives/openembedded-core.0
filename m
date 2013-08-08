Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 23E5D608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 09:13:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r789DeBl014602
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 05:13:41 -0400 (EDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 02:13:39 -0700
Message-ID: <52036142.8070401@windriver.com>
Date: Thu, 8 Aug 2013 17:13:38 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Olof Johansson <olof.johansson@axis.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<20130808090617.GF25081@axis.com>
In-Reply-To: <20130808090617.GF25081@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
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
X-List-Received-Date: Thu, 08 Aug 2013 09:13:46 -0000
Content-Type: multipart/alternative;
	boundary="------------030408050905090207000100"

--------------030408050905090207000100
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 05:06 PM, Olof Johansson wrote:
> On 13-08-08 11:01 +0200, Hongxu Jia wrote:
>>   create mode 100644 meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb
> The recipe is called libdbm-sqlite-perl, but the perl module is
> called DBD::SQLite. Is that intentional, and if so, why?
'DBD::SQLite' is a name used in perl, see
http://search.cpan.org/~ishigaki/DBD-SQLite-1.40/lib/DBD/SQLite.pm 
<http://search.cpan.org/%7Eishigaki/DBD-SQLite-1.40/lib/DBD/SQLite.pm>

libdbm-sqlite-perl is the name which references the rule in
oe-core (such as libconvert-asn1-perl_0.26.bb, libtimedate-perl_2.30.bb)

//Hongxu
> Regards,


--------------030408050905090207000100
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/08/2013 05:06 PM, Olof Johansson
      wrote:<br>
    </div>
    <blockquote cite="mid:20130808090617.GF25081@axis.com" type="cite">
      <pre wrap="">On 13-08-08 11:01 +0200, Hongxu Jia wrote:
</pre>
      <blockquote type="cite">
        <pre wrap=""> create mode 100644 meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb
</pre>
      </blockquote>
      <pre wrap="">
The recipe is called libdbm-sqlite-perl, but the perl module is
called DBD::SQLite. Is that intentional, and if so, why?
</pre>
    </blockquote>
    'DBD::SQLite' is a name used in perl, see<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a
href="http://search.cpan.org/%7Eishigaki/DBD-SQLite-1.40/lib/DBD/SQLite.pm">http://search.cpan.org/~ishigaki/DBD-SQLite-1.40/lib/DBD/SQLite.pm</a><br>
    <br>
    libdbm-sqlite-perl is the name which references the rule in<br>
    oe-core (such as libconvert-asn1-perl_0.26.bb,
    libtimedate-perl_2.30.bb)<br>
    <br>
    //Hongxu<br>
    <blockquote cite="mid:20130808090617.GF25081@axis.com" type="cite">
      <pre wrap="">
Regards,
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030408050905090207000100--
