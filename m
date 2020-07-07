Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.80])
 by mx.groups.io with SMTP id smtpd.web12.11626.1594107710581938185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 00:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h/02A+sF;
 spf=pass (domain: windriver.com, ip: 40.107.94.80, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK9zXLqboBnxG/xDCXuQWkmk5asuTKTbdAMGm/kfj6HXbrYjpM1jXhg/z6OQ6ZMTtZququpFqnx61J6yEhAi+paRqg6+yil8dbeFfBVIVKzmWGcIkHLFJ84wZrwDXWTR5bhu5jDns1i9vuIy7Fswo79tF9JD9JKTKdqHMAqzUAaielxVZk4kro8vwyjD08ZpBIvskDmMsKjbe8n7MMCt5ZY8IFKwauXL5y6IOfYGrxyN1NVAOH7Ei1P2wdmTaJcIkHFneupAqBVQWEEFJQf3JboxHRP29pWN+y4lTgzN3EJuroNXaBmK2geN2trhKzSOUfUxcJgrfTb/+EEG+AhEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3q/3wZ6IglZKj9GgO+INRB0aOXDhczbbZL5D2JkTUY=;
 b=A+pNXvI2vR3kU28Bq805e3QUer/ehp/XJcvOGVChL0nOvSYclUxzSe6GAgz/fxJht8fC7hLTJ5F6ZI7CK88mNRL+H5U0BUtx7GmPRH17xlIwbN7c5EmH5QyjCe9yqX1fEq9qJR85kZYIr6Ogtllvyi/9hMavPac/RCo5+thX1iJ2LuzSlGNu3forie1SJHXTKOSWwOv2g84sTjJ/O03sKP52bzlpgFQQF+v/06Kx550+Yxyz2JMAVu1bT4UefBgVEUg5d3OW0ccaNWyCOFburqO1nOvu7gBeicO3ErlfloIRGWRj6x68lbHDKDLzZ6/vy09tjFzXT+czt+ahVT+cRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3q/3wZ6IglZKj9GgO+INRB0aOXDhczbbZL5D2JkTUY=;
 b=h/02A+sFhBOnEe4gmlT3TYRBYvEnPNN1Q9j2mVzIwtP5bXts/cC6SDBlxM0kwrTY+wUjNVMB/BVWXs7YykiijVD3LFmdMSaip71t8wMAP7ZDYDN9rjOSsPs6jaWJF4F6NI9Hkv+b4HVWK0hSi071lXD966VpTCGC/AZ8mwDdndg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 7 Jul
 2020 07:41:48 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:41:47 +0000
Subject: Re: [OE-core] [PATCH] dpkg: update SRC_URI
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200707025305.3408244-1-changqing.li@windriver.com>
 <CANNYZj_5-Sd-zww=bL8=_sDSL8P19iPB59w=+6c-tyCwBVY3rQ@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <c71b7ba8-4d31-492e-eca7-92bf0a9993ba@windriver.com>
Date: Tue, 7 Jul 2020 15:41:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CANNYZj_5-Sd-zww=bL8=_sDSL8P19iPB59w=+6c-tyCwBVY3rQ@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0145.apcprd02.prod.outlook.com
 (2603:1096:202:16::29) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR02CA0145.apcprd02.prod.outlook.com (2603:1096:202:16::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Tue, 7 Jul 2020 07:41:46 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 276bba6c-4566-4262-52b9-08d82249341c
X-MS-TrafficTypeDiagnostic: SA0PR11MB4541:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45414A3D160C8F89D83BD11182660@SA0PR11MB4541.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bDMT0u1f2bF2kqv5gzP8o6i/l6R3XM0RHTRZ5McQldy1n5TRvp7iIGUli+6mHiTIe/wDQVtWUPyAriFyWZpFILRcJkANMEBE/IB7SfGJJqv3cYt2+iKUQXeu5WiCnmspqN/QXnCf9D7qlCHA3sDMKisnGeNhEvsvgygs6p2YUjBYygsTw5mLBrCIUU8NCgbKdrY1nAigbXfl6raD7WPRprxk8E36ugUcE7+sd9qYScT/1IqPqXzt+U5NYA+EdMDM+db3NrVGbAPbRpL+pD67QiLABld94ue/ABOrff5/5IdxJrT4KBn4JNou5fgg/+YqpgGgH9QfU4DYpqSEdpA02iGRsDk8FTfeZNEVALBdjm0flN345D/hzSWDjz4V6KVn6/Tzqhn6AtGURfB49LL8UTth66WEchucjWB8IylExfIRL53k991BvbXo2Vqi3XH3WYXAE75g1cJ4tM1OW1jh9vaqDsXZk1Grw4nTWeioy/rfW0wt2/l+DHRex1xtTs9yPcymYZ6BA/VUlLiwM67Z1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(346002)(136003)(396003)(39850400004)(6486002)(33964004)(316002)(66556008)(4326008)(166002)(66476007)(44832011)(6666004)(16576012)(31686004)(26005)(16526019)(186003)(8676002)(83380400001)(966005)(478600001)(6706004)(5660300002)(66946007)(53546011)(6916009)(36756003)(31696002)(86362001)(8936002)(956004)(2616005)(52116002)(2906002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bROyGWmZ0LqDXsR2lnd+F6FRUAxIaMcBShay7jBi4LUfOQmpPs0Pf5HqJ75yThdm3tY7l9VzhH5QgY5cYHhSJBQ46aL+BtYn2pcssD1Uzizny+gBsxBcivsWT8OP/z9Ou4w2AaJSnGqn8hRWNncbvxzyzxlyG3MPrZSzqqh75DM1IIMWeNS+qlWuSxnun2ngvZSqs5SANdhJjMKu7PL7xUPS/0ijayy3h8J48UCabRFDPmCHLvd9+py0l9Ubuy7asPJphvuMxGU/uhdHPrfZ/ixuB5mdhg1xt13+V/mJnqpx8OzZbQ/82wsgeVATBkzm9x3qFoTCsETbCIA/hYpJXFxhWB3QhDflTVq5as9ntg8xHHYOMZENxrdT1PNks8NEL+5A0TlbO2uMtfD3+NkO8iMa2S+eh407mpJLa6f7A4qvG2PNUKpi55kxVTk8efNFylq7i/tE3Me9/S5ShBR1eA9tvxIcKYK+Fp270qAdQWk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276bba6c-4566-4262-52b9-08d82249341c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:41:47.7991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5A0FV6c142PGFFayiogQZNX/PMSKgN4S63E2q4rnashC05cXaZ9sJ8ui4oBhIzZkaj2VFDfaqPkAYm8dK5kc5GZ3T9JXDL8W/ZhyoOqzFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
Content-Type: multipart/alternative;
 boundary="------------D59F5EE018DAA6C4C57F76ED"
Content-Language: en-US

--------------D59F5EE018DAA6C4C57F76ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/7/20 3:36 PM, Alexander Kanavin wrote:
> On Tue, 7 Jul 2020 at 04:55, Changqing Li <changqing.li@windriver.com 
> <mailto:changqing.li@windriver.com>> wrote:
>
>     -SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
>     +SRC_URI =
>     "http://snapshot.debian.org/archive/debian-debug/20200308T085219Z/pool/main/d/dpkg/${BPN}_${PV}.tar.xz
>     <http://snapshot.debian.org/archive/debian-debug/20200308T085219Z/pool/main/d/dpkg/$%7BBPN%7D_$%7BPV%7D.tar.xz>
>     \
>
>
> This breaks both automated version checks, and automated version 
> upgrades. Can you change SRC_URI to take dpkg from git?
> https://salsa.debian.org/dpkg-team/dpkg
>
> Alex

OK,  thanks.


--------------D59F5EE018DAA6C4C57F76ED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/7/20 3:36 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_5-Sd-zww=bL8=_sDSL8P19iPB59w=&#43;6c-tyCwBVY3rQ@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">On Tue, 7 Jul 2020 at 04:55, Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote">-SRC_URI =
            &quot;${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \<br>
            &#43;SRC_URI = &quot;<a href="http://snapshot.debian.org/archive/debian-debug/20200308T085219Z/pool/main/d/dpkg/$%7BBPN%7D_$%7BPV%7D.tar.xz" rel="noreferrer" target="_blank" moz-do-not-send="true">http://snapshot.debian.org/archive/debian-debug/20200308T085219Z/pool/main/d/dpkg/${BPN}_${PV}.tar.xz</a>
            \<br>
          </blockquote>
          <div><br>
          </div>
          <div>This breaks both automated version checks, and automated
            version upgrades. Can you change SRC_URI to take dpkg from
            git?</div>
          <div><a href="https://salsa.debian.org/dpkg-team/dpkg" moz-do-not-send="true">https://salsa.debian.org/dpkg-team/dpkg</a></div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>OK,&nbsp; thanks.<br>
    </p>
  </body>
</html>

--------------D59F5EE018DAA6C4C57F76ED--
