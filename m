Return-Path: <alejandr@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6E46B96C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0GFUi+gYUeV+mMt6TlnrHNkz9vabEdbZuUSOzEDSY5g=;
	b=cjDrelCoLiK5BN5nU9QcwG/NvItYohVmYhd6Kztu3XDh7uqcvnUVzkNNwT938jtAYrYYykmz0XO2XzRvvxZ2sRnH7kCYJryY/7yu0PF7mTbrxkrq1LCXltwYXoatlz8DfMeczmgwx9kC+yuE3RBeo4kI326J45tQzuUH3kffajE=
Received: from BL0PR02CA0032.namprd02.prod.outlook.com (2603:10b6:207:3c::45)
	by CY4PR02MB2678.namprd02.prod.outlook.com (2603:10b6:903:124::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17;
	Wed, 22 May 2019 16:45:06 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BL0PR02CA0032.outlook.office365.com
	(2603:10b6:207:3c::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via
	Frontend Transport; Wed, 22 May 2019 16:45:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1922.16
	via Frontend Transport; Wed, 22 May 2019 16:45:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54851
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hTUMT-0003LI-7f; Wed, 22 May 2019 09:45:05 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hTUMO-0004iP-5Y; Wed, 22 May 2019 09:45:00 -0700
Received: from [10.23.116.38] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1hTUMN-0004iM-Qf; Wed, 22 May 2019 09:44:59 -0700
To: Tim Orling <ticotimo@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
	<b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
	<CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
	<1cee8ee543463712e25b4ea4450fb40242a9e84e.camel@linuxfoundation.org>
	<CAMKF1srz+_Tk5=GNWzBLpNRXoqdCYOmLyNm6XKkFJQFvGcpX=Q@mail.gmail.com>
	<f10bbaa1a0d8ef62f7b7ffd8dfae101b906fafce.camel@linuxfoundation.org>
	<CANNYZj89w2eT2bN=8SmSwmAPzYADLPk=GmajvNJTif+0q3eO+g@mail.gmail.com>
	<CANx9H-D0E+ixNv3Tj4ZBir3Z8xv0=G_1nkufvML7CwA=4RigZw@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <ae6df54d-31f2-ef8a-2c58-e8a873752904@xilinx.com>
Date: Wed, 22 May 2019 09:44:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-D0E+ixNv3Tj4ZBir3Z8xv0=G_1nkufvML7CwA=4RigZw@mail.gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(199004)(189003)(9786002)(70206006)(966005)(336012)(8936002)(81156014)(81166006)(486006)(4326008)(70586007)(71190400001)(446003)(426003)(316002)(16586007)(6246003)(126002)(476003)(2616005)(11346002)(356004)(8676002)(65806001)(65956001)(478600001)(186003)(606006)(229853002)(31686004)(236005)(54896002)(6306002)(64126003)(31696002)(26005)(84326002)(5660300002)(77096007)(36756003)(65826007)(53546011)(33964004)(76176011)(110136005)(37036004)(58126008)(106002)(2906002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2678; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f7a8053-5c55-469c-5b4a-08d6ded4d81b
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:CY4PR02MB2678; 
X-MS-TrafficTypeDiagnostic: CY4PR02MB2678:
X-MS-Exchange-PUrlCount: 2
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB2678846CD5F6371653C79984AC000@CY4PR02MB2678.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0045236D47
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vEwCAB53VtNeoVAuUpqF+Ox8rrKhrFPmbI7LDIKhhgicnlfcKigRDFSNXBzyRF+5SQHvvl2n0CAtfGgSzhjJqVTFp0xNaXiML+urGwZck4CzU+QyFC6Y+2U4r0cordgzRV3Mq2yH3YfR5CCE7AyYFIDEDfLyIqxrMRQWRSV8d8PBIivWRHIEeGfFpsM2D6dxuGhTT8kopv0wDjjqi8xtBISA6AfVf8z1k6NfnkfbY2r6ySE6lx5TBJFcumQPEhG+mp594yYhZY7h0jPX2wD6DoftFUfXF3IODzqzqieZvMZbAjGjAjDzit+ZHciuyn0sn8GQURdfFUFXfaDJD5oUHpsjtcIPF9V4hRlB87QxHdv3EgMR41d+Cvtq80KBqXDGW9CqQLLGTyYy+g8MkD9XWkinv0zG4rV/zSYyD3a+6kE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2019 16:45:05.6665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7a8053-5c55-469c-5b4a-08d6ded4d81b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2678
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Wed, 22 May 2019 20:21:45 -0000
Content-Type: multipart/alternative;
	boundary="------------FC5A3343BD83B0E2B632829B"
Content-Language: en-US

--------------FC5A3343BD83B0E2B632829B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/2019 7:01 AM, Tim Orling wrote:
>
>
> On Wed, May 22, 2019 at 4:27 AM Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>
>     On Wed, 22 May 2019 at 13:05, <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     > I don't think we need to switch our default, just be able to
>     build say
>     > oe-core without python/python2 in HOSTTOOLS and without needing
>     python
>     > 2.7 in OE-Core either.
>     >
>     > > Its good that project is taking lead here but we might leave many
>     > > users behind.
>     >
>     > I suspect python2 will end up in a layer of its down which I'm fine
>     > with, dependencies can then be clearly seen.
>
>     For what it's worth, Fedora is getting serious about Python 2 removal,
>     and they have a plan for it:
>     https://fedoraproject.org/wiki/Changes/RetirePython2
>
>     "All packages in Fedora that need Python 2 to run will be removed from
>     Fedora 32 regardless of their dependencies. All packages in Fedora
>     that need Python 2 to build will be removed from Fedora 32 regardless
>     of their dependencies. "
>
>
>
> We have discussed moving meta-python to its own repository (not under 
> meta-openembedded). As part of that move, I am proposing the existing 
> python2 recipes move to a separate (deprecated) layer, as RP mentioned 
> earlier. Then meta-python will become python3 only. We will also move 
> recipetool/devtool to provide python3 (only) support. People that need 
> python2 will very soon have to live with older stable branches. This 
> should not be a surprise.
>
> We also need to do whatever we can with upstream projects that are not 
> feeling an urgency to move to python3. They should likewise not be 
> surprised at the need to switch.


I would agree with this as well.


Cheers,

Alejandro


>
>
>     Alex
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--------------FC5A3343BD83B0E2B632829B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/2019 7:01 AM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-D0E+ixNv3Tj4ZBir3Z8xv0=G_1nkufvML7CwA=4RigZw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, May 22, 2019 at 4:27
            AM Alexander Kanavin &lt;<a
              href="mailto:alex.kanavin@gmail.com"
              moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 22
            May 2019 at 13:05, &lt;<a
              href="mailto:richard.purdie@linuxfoundation.org"
              target="_blank" moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>&gt;
            wrote:<br>
            <br>
            &gt; I don't think we need to switch our default, just be
            able to build say<br>
            &gt; oe-core without python/python2 in HOSTTOOLS and without
            needing python<br>
            &gt; 2.7 in OE-Core either.<br>
            &gt;<br>
            &gt; &gt; Its good that project is taking lead here but we
            might leave many<br>
            &gt; &gt; users behind.<br>
            &gt;<br>
            &gt; I suspect python2 will end up in a layer of its down
            which I'm fine<br>
            &gt; with, dependencies can then be clearly seen.<br>
            <br>
            For what it's worth, Fedora is getting serious about Python
            2 removal,<br>
            and they have a plan for it:<br>
            <a
              href="https://fedoraproject.org/wiki/Changes/RetirePython2"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://fedoraproject.org/wiki/Changes/RetirePython2</a><br>
            <br>
            "All packages in Fedora that need Python 2 to run will be
            removed from<br>
            Fedora 32 regardless of their dependencies. All packages in
            Fedora<br>
            that need Python 2 to build will be removed from Fedora 32
            regardless<br>
            of their dependencies. "<br>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">We have discussed moving meta-python to its
            own repository (not under meta-openembedded). As part of
            that move, I am proposing the existing python2 recipes move
            to a separate (deprecated) layer, as RP mentioned earlier.
            Then meta-python will become python3 only. We will also move
            recipetool/devtool to provide python3 (only) support. People
            that need python2 will very soon have to live with older
            stable branches. This should not be a surprise.</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">We also need to do whatever we can with
            upstream projects that are not feeling an urgency to move to
            python3. They should likewise not be surprised at the need
            to switch.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I would agree with this as well.</p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANx9H-D0E+ixNv3Tj4ZBir3Z8xv0=G_1nkufvML7CwA=4RigZw@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            Alex<br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
  </body>
</html>

--------------FC5A3343BD83B0E2B632829B--
