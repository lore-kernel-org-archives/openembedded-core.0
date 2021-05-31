Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.38807.1622424597066022666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 18:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=onhTqlPn;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17857edaee=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14V1TtLm029054;
	Sun, 30 May 2021 18:29:55 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 38vdx0g6h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 May 2021 18:29:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN2W5uM83Hgn/Ddd5Os7mRK0JxzxANGwS+l6w9mKxV+naBI7FFvWeMtalMlSxVtSQJfCjzE1L7RpJOvfGqVp7cfssQ30LPIx0Uv9T260EiO8wBc+mx+bPPU8FkaGiQZIf+JG62uzNwyyoVzoJGTJVrlp7VkLiPsz5GOqgeBY4k16/kdTojf0UtnInLUS4oIjBmxcL1WLuaZ8QmNs6Zf2653TTqxEwaW8v8nDVCm3a4ePRnwxl93el8bJqsBtJhDcLwwmiNIk1uOzkYFX1FsiLnFQu0KOhBdoNek0iPKmhUYGLJVdJkEVDQbSbABe/bDekGX2CVjGXvbFdW3xkqybpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvGPHkFX19GdEpFlMLQWKY+3C9/J4dV/3WXDefg6ebM=;
 b=EXtJ74YZCobr4q9ttY/vkYUdAStMt9WpwuVLBu01BfmpcpS5hNJM9Dx6OAwE62OUMZlzIxb1Q+h80NTYzenGtS5jNAuAmo72Sgc/Uw6nshdL9SX9kxT1fHgi94q4DDFS3x6ErhM0N9WVIOl4ViPbw17xlEJBE9t3VRm5iXC7CdDUcz9fwebSEZeHSDvpFUJCoL4U0JZ489UomvdJnhaiaVnqtjCuBXdHdG01OlmvkX8jtLCpHvPk5Lm86azpmRneLxrgL5GL4+eTnkCBNqqi/mUdFkA91t3EUwzMuTW5G5J0y+5vhTl+mtr/vlwMlD/1a3+CtJC+1XBTCvn1D23Wkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvGPHkFX19GdEpFlMLQWKY+3C9/J4dV/3WXDefg6ebM=;
 b=onhTqlPnOyRu5EsVfIOpENube709JjT7YoHhw+ePjwWD3it82AsHy/2ijRbOIYKpTSYIH7ApjgPZn1XQxlEabR6sLZWteTbayd8KPW4PxUgfPCRnwY1efa0GQC4zWStDExHHx1ihj7Qo8J4HvUqDbz1ZIOz4TJDONjDlRz/lYPQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 01:29:53 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b%3]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 01:29:53 +0000
Subject: Re: [OE-core] [PATCH] bash: fix non-fatal error in log.do_configure
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210528082955.6819-1-changqing.li@windriver.com>
 <CANNYZj8YVuo0sCcQDrsFNgf-Dc199pOVr0G6-jfAg7i0tY1Arg@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <31706f21-a2e0-0014-02d1-466554a4fd80@windriver.com>
Date: Mon, 31 May 2021 09:29:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANNYZj8YVuo0sCcQDrsFNgf-Dc199pOVr0G6-jfAg7i0tY1Arg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Mon, 31 May 2021 01:29:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f194ced-b888-4370-29b7-08d923d39703
X-MS-TrafficTypeDiagnostic: SN6PR11MB3504:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB35042C7D301680527FDBB34F823F9@SN6PR11MB3504.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tZ2EIh1Xsn7RfNKbsMmwTb7gIvPapkCz06FuT9WUf+jY/t8ZkdsbKqlgOeUqYFPT8uHhDH2q73vVKZ7SlTkt0hwv17dGsoKr2816rWI/+tTOkfm40/ohySNmiLOAcDHwYJELn19K0/qmn/EDWT9aNRO41e6NUGcJJlsSAY8JSf3RwzCHXNRJOlW4tizKtjsqjbfH4atjT+X3XtDNkBxGGPevnhCvgCkcxT3/fNwDlv8+J04xaamuQQ5y2KjuboCUYEU8eU7aJNJwciGLoGy1ZLrpSsvUGJ8xYfikjVrqPQ5s09CsjVMy2Tj9qUsbOarVKWqe4RNx8OrWPcglTWkx4167UG4rI3WNc0fH4LfJ1CfWjdkm3EP9ydgZFeESTRLqm9Y4BjCWTAuXkaR+Xru9fVild1lTtQssD5YeHEmub6RTf3fa3LWgHi492/iPpKi50yFCd8RImqe2T4zh+nCVJLJGOyZCAn/Njwa9mb50wK5LIntz2yFBqvBWY+Sg5QYWb3aOA41TZfHHXH2I5EH65KEObltOQfY4c5UybVq1lkD0ACcMJxBNOEil6ph4IquRyxWdmN9GjKrukpnNOxUNLxBpWuCrdd0znVzcjonL01vMV2AWKd0pWlnrJnyZJISlAHrBeTU6GXHvOfISTreYGyEwystJGsAPPyjQDGDIWbzNNUbrSUyTP32coicqi2gHFr2+pbVmPsjhFSjSHSDVCddYAPKOrxR6jF83U2h8Vbo299+PSk+mpr/wFkdhNUay
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39830400003)(83380400001)(956004)(186003)(4326008)(26005)(8676002)(16526019)(86362001)(8936002)(2906002)(38350700002)(38100700002)(478600001)(6916009)(66476007)(6486002)(6706004)(316002)(16576012)(5660300002)(6666004)(52116002)(66946007)(33964004)(44832011)(31696002)(2616005)(31686004)(66556008)(53546011)(36756003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YW1TUEJ2VXNrRCtHMGxiTmFDY2xkS2FSSlBFN3VlTmNxZE1QNkM1WnZLYWk2?=
 =?utf-8?B?NDRrQXMxaGhTcG4rb3ZQYWovYUd4K3NEcldReXZpRHZvWGlkSGhYUlJqbnlJ?=
 =?utf-8?B?UTZZUm5vR0RYaEF3U1QvZHdwY2txNEdHYTZCR2tDTE1xa1lTcEZXdnNlUlJE?=
 =?utf-8?B?Nm5Ga2U3b1RWUm92YXJsdHpjYm5CNVRlTkVLTWdkWXZ2SGtJaGFjbldFNTRK?=
 =?utf-8?B?bnRnZjlZQXlnMzBxODd3bWc3SUFOZ3ozL3QyZk00djlnU1pHUy9zQ3lxWi9j?=
 =?utf-8?B?R2hGZTRpd2VhYkE2dGM4eE9XdUNjVVk5UmIrVlQ2Q3BqbEYzNFBGMEdzMVNJ?=
 =?utf-8?B?anZ6SzFpN0lBSTVuTkc2ck4ydVNyTHZJdXI2SC9mZE84LzQ1M2tYWGpOMWky?=
 =?utf-8?B?eU9jM3FqRlR0S09qSW9LRmJUemV4WTFWMjVzT2RIcXhaYml0TXAzSXNUeGFZ?=
 =?utf-8?B?dW9kbU9FcEozOXlCakwwOCsyK2VhRVVJTmhhUi8ySUZEMWVrVlhUenNDQzgr?=
 =?utf-8?B?bk9MRUJkT2hsVWRTbzhuM0pvN1VxR0VUS1BRUFQwMDFlRjM4d3JvU044Z3VQ?=
 =?utf-8?B?c2RmSHFWUE9oNTVmZUxCVTFlSjVYaklDcElSZWwrMUJVZ1VyeXVSc0RlM2h5?=
 =?utf-8?B?WWlrU3RQV3MvQlliNzRVMEY2VlVYQXBhOWJoTVA5KzNmaVZZSzZSQzUzc3JD?=
 =?utf-8?B?QzlFeG95NWNUeGhiYWcyTGNCNHF1cGFWT1Z5OWNiWEEvNkR2S0FrY0NaZExa?=
 =?utf-8?B?TC8vWmEyUXB4SGtoVkFxZmVxMlJXOHpUU01iTFVGVGVHb1REUGp4T25rbER6?=
 =?utf-8?B?UzdLRSt2QllSdzBySnU2bWYwLzArWFRQK3doRUVYQnM1WGs1QVYvTGgweG9n?=
 =?utf-8?B?ZW9EYUlaVERydlBpSW1YQ3JMZmYzb2hXZ2p0SUNWdTdQRjY5ZlE5ZHhQWnpz?=
 =?utf-8?B?VHVsZmNWZnVFRkllMU9qNkRSVUUrVTBsMUZwTHBlbjdmZlpTK25QSnRTYVI0?=
 =?utf-8?B?RDJYZFV6R3hwcE81aEhZZmhKc2t0S3BpcW5zbzRCZ05EY2tkU1l1NlRUYXk5?=
 =?utf-8?B?S0pGR01ubzJOMEdoQjVOV2MwU3lKYjljbkNDamdPakpTWi8rWWFpQzRYYWdC?=
 =?utf-8?B?N3RHcTdFdXRuMnl5N01nZVREM2pSQU1OWjhLV2pXRzJ3NFNFRUhLZnY4cFlx?=
 =?utf-8?B?NmQvS2t5NXM5WW00L1JHQW9mZmU2aDJjM2J5azJEanl1UUU5MFNRbFNBSno1?=
 =?utf-8?B?LzZaT0REK0JJMk44QkU0MWM1RWM2U0RiQkdMb0hpajlTTWdWc1JadjJBNDlq?=
 =?utf-8?B?by9oTlMrcXloSkQ1K2ZYVHplWTYxVVZNNi9ESDI2eENPaHNoamsxTm5jZ25o?=
 =?utf-8?B?MENiTE02dGx4YllkSTFYUDlZT1V6QlRxajdVdm04WVBZd3BsOStoeXJWL29w?=
 =?utf-8?B?MkF0ZWM1c3h2aHEzUi9CNklpUE5IZ1loVGFQZ2FISkNQMCtIRFlUR3lBYTNI?=
 =?utf-8?B?NU50c2xHdlRDSE1iNnZSclc1RnlZbFNNQWFxR3E1Q3QwVlpFVWQ2UngrNVF3?=
 =?utf-8?B?RG5NN3pGV0tiZXZaSkpOQ3hkWUx0ZG9FbG9YTzRwRDNONnRTQlpYTU50cGpk?=
 =?utf-8?B?MGw5OTcvTzFLNkVMOVkrZ3ZUT0xRencxZzV0Z2FoaUQ3ajU5OUw4N3JVQ3E0?=
 =?utf-8?B?VUo1bVc1MldWakNQYVl4eXlqdjd3ZTIwMEJySGdoSXRqRldZd2JDNmk1VVVq?=
 =?utf-8?Q?N5RQl2hP10Sk/owmYRlcI2aIW7WFxWzNpOkdViT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f194ced-b888-4370-29b7-08d923d39703
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 01:29:53.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QN7i/See9Uhi0KtXbcPt9CAcxpVsxmXn7IQFUx5Op0Bzx7dGZ7QZ7dhmfZ+GuqFqPYRpkjOxx/ri/8M+SnXug1S3ZqiBGh3Pe1Jn5dSlLgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3504
X-Proofpoint-ORIG-GUID: sTXQ2k8E4oZGZRhdCwikW587jD2obtCC
X-Proofpoint-GUID: sTXQ2k8E4oZGZRhdCwikW587jD2obtCC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-30_13:2021-05-27,2021-05-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105310011
Content-Type: multipart/alternative;
 boundary="------------347A417317D3E320CFF38CF2"
Content-Language: en-US

--------------347A417317D3E320CFF38CF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 14V1TtLm029054


On 5/28/21 5:24 PM, Alexander Kanavin wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, 28 May 2021 at 10:31, Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>> wrote:
>
>     error in log.do_configure:
>     ERROR: invalid first argument to AM_GNU_GETTEXT
>     ERROR: Use of AM_GNU_GETTEXT without [external] argument is no
>     longer supported.
>     + dnl initialize GNU gettext
>     +-AM_GNU_GETTEXT([no-libtool], [need-ngettext], [lib/intl])
>     ++AM_GNU_GETTEXT([use-libtool], [need-ngettext], [lib/intl])
>
>
> This does look like something that should be properly fixed upstream,=20
> can you rather make a patch that fixes the issue at the source please?

Upstream uses m4/gettext.m4 included in it's source tree,=C2=A0 which is=20
lower version.=C2=A0 so don't have this issue. Maybe they will correct th=
is=20
problem when they update

m4 files in their source tree.

we have this issue since we use gettext.m4 in our sysroot, which has=20
higher version gettext, in higher version, no-libtool is removed.

>
> Alex

--------------347A417317D3E320CFF38CF2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/28/21 5:24 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8YVuo0sCcQDrsFNgf-Dc199pOVr0G6-jfAg7i0tY1Arg@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Fri, 28 May 2021 at
              10:31, Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              error in log.do_configure:<br>
              ERROR: invalid first argument to AM_GNU_GETTEXT<br>
              ERROR: Use of AM_GNU_GETTEXT without [external] argument
              is no longer supported.<br>
              + dnl initialize GNU gettext<br>
              +-AM_GNU_GETTEXT([no-libtool], [need-ngettext],
              [lib/intl])<br>
              ++AM_GNU_GETTEXT([use-libtool], [need-ngettext],
              [lib/intl])<br>
            </blockquote>
            <div><br>
            </div>
            <div>This does look like something that should be properly
              fixed upstream, can you rather make a patch that fixes the
              issue at the source please?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Upstream uses m4/gettext.m4 included in it's source tree,&nbsp; which
      is lower version.&nbsp; so don't have this issue. Maybe they will
      correct this problem when they update <br>
    </p>
    <p>m4 files in their source tree.<br>
    </p>
    <p>we have this issue since we use gettext.m4 in our sysroot, which
      has higher version gettext, in higher version, no-libtool is
      removed.<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8YVuo0sCcQDrsFNgf-Dc199pOVr0G6-jfAg7i0tY1Arg@mail.gmail.com">
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Alex<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------347A417317D3E320CFF38CF2--
