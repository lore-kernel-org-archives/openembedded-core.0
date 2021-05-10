Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.76])
 by mx.groups.io with SMTP id smtpd.web12.31819.1620653181139664490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ha8/5KbP;
 spf=pass (domain: windriver.com, ip: 40.107.236.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tddhl6PKLtB3oVehPmMQ7FamBKhdSUAWFrfNDphcegcMoO8yEJ6XSuxfhBL/TSt4o3oFIFVeUMQb9Mxyb5g8Gq7OBu1gbJTZyaH25bhI+i68y6HHjR0VNnteoRz+cPwrLLcDQfaYiJ1S/TDhQ3CgGqwLL75xQTAOjwzVQXRU8ZDWR40H9uobmXVDsLkusmiyUbjIp/xPCmhpS3m+8BoAoZttOMC6IJVtOQ82rkEua/hU8c5W/EDcGQx1nK8iuOlR5M0/R8pW7GYqeXOWXchj3cKPg/Jah5IOGosRjjAn3q16gmTSxKHDkgVmDuMh4XTIMYuwR4tXddmAk6ZQCSU6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fs1RpVufVVpSqiNdNYNDiecNoo8/SQmsOqMoFjlG6uY=;
 b=i613DYE2mePfT90RURRJZcZTNwEghoKocnZGFBF9ddupLH1rkzfz/QuFI+/Y4f+ng1lI3ybpilqHJzxx6CwdDSKM9DFcw2lGvuLG5ilDs96RDLJ45XZ9EPETMJ0gC01XQ7IKBprNSspRRttnVRSEEX5OWaoN3ApwYZct8xJUaK2gwP8BA7JQfikx9jIxYEeAzHToY7GXXP8tdebvM5VVG7jaUiu5AZqHkwI0rgVP/4xuAD/4CvEu46gJXEg4wWnCsRILZlRPvRBCMatjbeBhEWww8ZzHygHCDq3gIsg4OvStYpNq1Z2LdyAwJaYDE/or0q/po5b8AeJn3pK33LSSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fs1RpVufVVpSqiNdNYNDiecNoo8/SQmsOqMoFjlG6uY=;
 b=ha8/5KbPKjvm0cRQne5/l+ODluIdkLpbUzG1Cn/zISFbbJk89XifwLS0AM5SUvln+inPLKuDfyBeQIs3RxVylWPrTJgdNWSTi5XDSoNv4p8xtyDwRbVaFUd1tqZtWS66gZ47yP1sawSJNs4k/4fBqI5ZuPYdPJbfKuMa4QbAD0A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 13:26:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 13:26:17 +0000
Subject: Re: [OE-core] [PATCH 22/61] ffmpeg: update 4.3.2 -> 4.4
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-22-alex.kanavin@gmail.com>
 <CAMKF1spN4wQfxxiVoMmavZ+7v+gKzyU9H0wK4YAJWNV9qv7RVw@mail.gmail.com>
 <CANNYZj8wm+JPZMOUCWtTHuE4jzSQNZKz+61u9fB6rgiXVf1DZA@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <44a48512-226b-9c74-4cc6-01b56b82c0e7@windriver.com>
Date: Mon, 10 May 2021 09:26:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CANNYZj8wm+JPZMOUCWtTHuE4jzSQNZKz+61u9fB6rgiXVf1DZA@mail.gmail.com>
X-Originating-IP: [2607:fea8:c29d:d7c0::12bc]
X-ClientProxiedBy: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::12bc] (2607:fea8:c29d:d7c0::12bc) by YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend Transport; Mon, 10 May 2021 13:26:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14bbc798-9445-47d6-3fd5-08d913b73100
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376667967FA767EB788922A59F549@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	adxyeeSmPw08+HytmE2EBlWXOKUB9nP3aipx7vJ4JpwVXZteFzKXBTY7hFZGpBNEg2uiFFHt5kjOK2IDl73VFrdUn93UOqPwDt92dPRm3JJBdYpQ1nqVQK1R7ZqDohDn8G6L7vXpyN71RX+iSoDxdDDT2c0Q1CbtqFwB7XbcNFwg97h80EYdenXVfWBSxMHMppoWPh2xKR7HVsGN64GThKoSSCiwXbtTlkz+rzVLpV/THqvgi7lvuvd4h1qOO/fSrNUNNliAwBq++vuOsnoHrSloVYbpyGoDqunA5jvHhOhsmmkqORlOJURTv+i+aiCy5rxVhmyb7vGLw7TiiurxmF8ia/HhQzyXhviPks8MLrfpP9dZu7JaenwHFXOWZeKDjUUB0EMqo25UZcvtFgFYdOVskWzoBpd7PUdnbFvhAF/69q0MdzrMmXLOYKaGtWfuTa6/kuA+7/w75kCxU+eJoTe2RpllsI20UN6gmaTUblvfiAVf+y0LX23/zQYARwA0P6naG8Ab/G+YQq/+5zJq/6HGVSFxuF9fqxCFjq7tnC42jlbjJwniaHQ46OWtM/PEdSO63fIqUJVW6PliUjRhsPI8kSDYC+xRFtpjxab87XSkmzB0LrYoJo7j2WxtThgg+ofclAfj20dLg8VcJcmFQfmfKWLbhWvTPXB5P9VxauBBk8VWS79gmGjQzryxV86S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39830400003)(376002)(366004)(136003)(66476007)(15650500001)(110136005)(16526019)(478600001)(38100700002)(2616005)(186003)(36756003)(66946007)(44832011)(316002)(6486002)(33964004)(4326008)(31686004)(86362001)(53546011)(31696002)(8676002)(83380400001)(2906002)(8936002)(5660300002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dmRJUWVRR24zYXZscjF6M0JNbGFzRDRNOHdDbWZBQXhoSnRMNnZYTzQxMGN6?=
 =?utf-8?B?dVRxTkE1YkxtbVY1VjIvL2s4dTNRYXBKZUZmdm9yYmlaWkMrdUM0bjBkbzMy?=
 =?utf-8?B?TlZFQWFDQTVWTmhyc0dHZjdEbjhmenNqVGxvNUNVVTNaYjY1R09KY0Z6Wk41?=
 =?utf-8?B?Wm5SZkxkWlNYd0xDWHBmdjRRYnNQV0hJNGdoMHFaMzlHWWNFNTU5SEtUMFkr?=
 =?utf-8?B?NlFOUHJmbXZZUm1RVDY0Q2EzT0QycjljVE9jTktDbXk3K3Z4WDB5T2FqalM5?=
 =?utf-8?B?N3FHVk5GMTUvOGxkY3dyK0pjV0xGa01MK0tRRzM3Rnd4am54dnAwTkR2YldB?=
 =?utf-8?B?V0FjR3NqZWNMc1ZGZkJFazlBZ2hwZmRjcDlFWGdBa3RJOE9xM2huemxIYzhs?=
 =?utf-8?B?UzF2MGREU2xtYjlHd3FyN3dDZlRuU3RZMkFvN2c4WVZ0M1FmbmtBbXg2N1J3?=
 =?utf-8?B?STM5b2N4K0xTTHRFMWtGYkgzRlFyc3A4RGw1ZUJkcFlNOTAwZ2YzRUp1QXFY?=
 =?utf-8?B?ZGxDSGFoNUFhUXE3MWNPSVZzNlBzVDRISDY0OFlhWlpRRUt6VlVBa1hNd3gz?=
 =?utf-8?B?cEI0UmJITlUyOW5vaVRJemlyR3FEaDViMyt5bnRtQXVqNkppUlF3QThpSjBN?=
 =?utf-8?B?TnA5cCsrS3BnRjIzM2ZXQ016RDhzSjk4Ly9QOFl3b3ZuZldTaVF3WUhKbzFv?=
 =?utf-8?B?aXAzc3ZCUGdWekZpZ3pzRHl5clRCSXlxVXF5OVdMSWtTVFB6dkxRR21NWGVn?=
 =?utf-8?B?bUs0NVhnemVyckxRd0NMek5IMWZkenh3ZFJaUDJFMDZkYXhnNU81OG43MEpl?=
 =?utf-8?B?ekcwSUV5L3NnNzVYS1JGbFVtL25nYzRqOEJiQUlQN0FKQ2UrWFphd3ZHU08w?=
 =?utf-8?B?b1lqUzRlbmJlYVozdjNuTnVxZmxPNFZZNk5ia2g4QnArdVRtcEk4NkZvTTNV?=
 =?utf-8?B?SCtRakNxOGNaU2lxM1E3VXdkUFdiakEveGZmeWtGYjZnbk5mT1M5cmc0MEE2?=
 =?utf-8?B?UnlJbWVBbUU3UmVIemFOdVNrRDYxc2FHMW44ZmJBYnlBUmh6Z0RMWTUzU3Zy?=
 =?utf-8?B?dFFsSDBLU3BvVXU2blRLSDBYMGVOd3BSQnVoaVpGZk0zbE1jN2RZb2xkTkl1?=
 =?utf-8?B?eG9JRkZoL1Y4TEFJTVNCUWFuZDVtTjlKQ0ZicjJpdEl5SktOMC9xNlRneVBr?=
 =?utf-8?B?WmpxZkxLaDF0K2xTY3lxSldVS2tBQ0JuMEdiWlNSVjg5MGJML0d0N2loLzA2?=
 =?utf-8?B?QlNMQ3grZHVTd2NkL0JhYm8rODlySmNqMDB1WG5EVC96Wi9DaGFhS25LMTJw?=
 =?utf-8?B?QmttSVRKSitOekhoYmFTSnJiRDc3VmdDQ0FPQW9abzJHSlgvd0kzK3dhck5y?=
 =?utf-8?B?cEZPY1FQZmNyODdRSGh2NlRqWXBrVUc5dmhuN28zdm9VWXJzbUJOZGFONExJ?=
 =?utf-8?B?QXdTQU5HZFRveGtLU3VKU01EcGZ6ZlRjL3MxNDJCNEtnbXozSis5WnJXKzNi?=
 =?utf-8?B?UlVrb0wzcTMxUHN6MVNveDI3aFFzZkFwdVNMUW5DQVZBdFNpbVJYNjVyYXhP?=
 =?utf-8?B?Vm1USXpZNkpiMkV3U2xMdTl4OTZ6VTZFa255SDlUZVdzd3RkSTFEYjJnOTRo?=
 =?utf-8?B?RStFL3NBd2xuQ25XNHptcDVNUW5ueVh2VVlvRitiazBad1UvR0JSdm9seEtw?=
 =?utf-8?B?MDBGM2VqQk5xb0Z0UzZBbFh1NWpXZ0RsTk9ZVmhyKzgzU2F3aHp0T3RtcmVP?=
 =?utf-8?B?UzVYazFWcDNPL240eWtqL2FCVnZkaCtVWmFqN2c4ZFQ5N1Q2RFFTVzhHR0Ux?=
 =?utf-8?B?eEpKdmk1bnM0SFp2c0w2Zz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bbc798-9445-47d6-3fd5-08d913b73100
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 13:26:17.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7dT3iWoAJg6gztinr7RnvF95thnhG3wv7+7ak3X2z1vuuPHHqVaeYTIXOZk0HKSO3bnOyVUv2gEAn7uw1vZZWy/RVdVBDz1Y3Sv+24luXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------D0EC51A06317346285A1B820"
Content-Language: en-US

--------------D0EC51A06317346285A1B820
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-05-10 8:48 a.m., Alexander Kanavin wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, 5 May 2021 at 20:25, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     >
>     > Drop mips64_cpu_detection.patch as upstream
>     > has changed the code in a way that's difficult
>     > to rebase.
>     >
>
>     Trevor was working on it and he has being trying to fix it for mips
>     case as well. So lets leave this to him
>
>
> The new version builds fine on qemumip64 (I will adjust the commit 
> message to mention that), so unless there is a specific way to 
> reproduce the failure that this patch was aiming to address, I don't 
> think this should be held. It's master, not a release branch.

It's been a bit since I've had a chance to look at it anyway, so if this 
change works then I'm fine with using it instead.

- Trevor

>
> Alex
>

--------------D0EC51A06317346285A1B820
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-05-10 8:48 a.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8wm+JPZMOUCWtTHuE4jzSQNZKz+61u9fB6rgiXVf1DZA@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Wed, 5 May 2021 at
              20:25, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" target="_blank" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              &gt;<br>
              &gt; Drop mips64_cpu_detection.patch as upstream<br>
              &gt; has changed the code in a way that's difficult<br>
              &gt; to rebase.<br>
              &gt;<br>
              <br>
              Trevor was working on it and he has being trying to fix it
              for mips<br>
              case as well. So lets leave this to him<br>
            </blockquote>
            <div><br>
            </div>
            <div>The new version builds fine on qemumip64 (I will adjust
              the commit message to mention that), so unless there is a
              specific way to reproduce the failure that this patch was
              aiming to address, I don't think this should be held. It's
              master, not a release branch.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>It's been a bit since I've had a chance to look at it anyway, so
      if this change works then I'm fine with using it instead.</p>
    <p>- Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8wm+JPZMOUCWtTHuE4jzSQNZKz+61u9fB6rgiXVf1DZA@mail.gmail.com">
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Alex</div>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------D0EC51A06317346285A1B820--
