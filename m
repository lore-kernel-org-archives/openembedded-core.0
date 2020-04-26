Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.42])
 by mx.groups.io with SMTP id smtpd.web12.4526.1587864897988722890
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 18:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JvWzjMx2;
 spf=pass (domain: windriver.com, ip: 40.107.223.42, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwVrJ9lr9p6W8wLwC8/Hb07WuR8AzyPfQvc2HfzLFH3YmjHoJt/frOKcIuKU3LWZVMb6IgbNgfdEGtAPSySOywi8ZUggZv1IpB5CDG3Xg8vDLhxKws+WuZmFI2tRk7idBRQRnEyRKCDssLQKIxaP9PG2H3Vx0KqJct05s6sHBjhYpDFMImNhJmAsH18J93hrdHmQe9kA9hYcSmooiZdzS/mPa2Yhkh0aq8mJwSxAMh3HKblBCDN8HL0jHajXa6MrpO3mJaXJmEMdzU6XjfJPm+psihzS3CaFYfBTO0tX/jfZkkd2uJPwCNTgW1DlZBAP3yll7su6GQ8b5hj+9BfSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcxQ6FxM9/CSsCMLGTFggjypj0+247D4YCbK31nWoZA=;
 b=BjeIzaTHpaMB1Ed/Z9LsbvA8Z1KoO3ET+A55gBawhZfzIx2Ek4gFuN/ji0Pv7ksMSmQmGg7QGDETEFQKS6XunegRyJRIngnhrz5GcuYUW/1efassN3ie7QMdjjZOZgdThjJl3iht9dngVoGuRNSClSXt8aYTa2AqZZ5v8K4DyMbns9CYdYD+kT7O+vqE+VlaIzbtTbxVy1QcCAm/JGos8l5N5tFiV5SnBW5uFBTCMimkucXsYpbcsb8PyeWHP2VFa8S0II+2O2Lg+QuN0xpfDqxp8rlE/sK6CHrsbcgK+oy+APqfXr6hFhBWU4ygJL/GHC+94FSp1q6GvR7RX5wCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcxQ6FxM9/CSsCMLGTFggjypj0+247D4YCbK31nWoZA=;
 b=JvWzjMx2DA7BDCuYKGcx3jp5WcKaDnxKzba15ZMWFzXur1qNzfCm5bSq7JpauhFQ6sOh4FOkAx7Q3FrrDdHHmJ1I1W4YSFWB7ZUzAqjDrRQqUrpN0MH9qk6ZHIwihOfHU48Q+Tx7BQTw+SvRcALrxytYmCkv1Bbknoe4m+PrM90=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3054.namprd11.prod.outlook.com (2603:10b6:805:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Sun, 26 Apr
 2020 01:34:55 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3ce1:6359:35f0:ec2d%6]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 01:34:55 +0000
Subject: Re: [OE-core] [PATCH 1/3] python3-pbr: change shebang to python3
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200424010941.191578-1-changqing.li@windriver.com>
 <6eb605a6c0ca7eb9a01a253da5ff1618a694da37.camel@linuxfoundation.org>
 <fe0fde34-92fc-72b6-30f8-6f4c0d801cd9@gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <f4f3e7e1-10a0-b9ee-816b-05ad98f28409@windriver.com>
Date: Sun, 26 Apr 2020 09:34:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
In-Reply-To: <fe0fde34-92fc-72b6-30f8-6f4c0d801cd9@gmail.com>
X-ClientProxiedBy: HK2PR02CA0158.apcprd02.prod.outlook.com
 (2603:1096:201:1f::18) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR02CA0158.apcprd02.prod.outlook.com (2603:1096:201:1f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sun, 26 Apr 2020 01:34:53 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ff32996-b7d2-427a-feed-08d7e98205ae
X-MS-TrafficTypeDiagnostic: SN6PR11MB3054:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3054247442B91A60C26A733082AE0@SN6PR11MB3054.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03853D523D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(396003)(366004)(39830400003)(26005)(5660300002)(16526019)(478600001)(966005)(186003)(66476007)(66946007)(66556008)(316002)(86362001)(31696002)(6706004)(956004)(110136005)(16576012)(8936002)(52116002)(44832011)(6486002)(2906002)(53546011)(33964004)(2616005)(6666004)(81156014)(8676002)(36756003)(31686004)(78286006);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q1+4c7HxuzC5E0trfDcENCddVb91elufDSMURf1fpyOLChlBO8sZEhaH4SVxV7LTHNhBdTFZE5nn7L4rHs0kxx6eO7VYr6gSWhwmIuyKLu4H+W56/TrIom/9N8JiwSaAT6HISDL5bM1oHg5waS0hUpN+xe7cx6wiLzIZMw2+xGqiaR4Al+TIX4UDT6q6yHVmz10SnCFtbXsHXOpirSLiU4rsIq+ZQ5xNgCDD2gRSfDKtabTnvMzKRbSWnJaCQ4AYU/zl1JLPXDyQd7apqADZDDXzgHG9gXtO3e7V11t3tr35Oq96R9onBT1dPSGKsbxd/5dev8zJIxdEgFZQhQrE1pHMiZqZfmjDTYhP0y0tfQhyxoJPaWXasQJOXzOORYmkZ19qheYejY7I3ehtUqW4wM6Ot/fwT/7qwGMy6mFqyroUVN21LjsUV7QrApJwcp4wAXv9YvonoAXkJ709D0BT7zqJ1aDtiz75GdzxHBMK/bwyd3vyExzje1Kg8oGRrrUUNBZI9MBYy126a61v7hCXRix43y18D4+y/9q46QREh+HFdwAt52GUCwq2OMtO9910zL/mWDbRivCBTrOt5VHTgc1BQG63UdykKc8A6TFmXTjwq+eSMBiUNOduo+oqcEDQ
X-MS-Exchange-AntiSpam-MessageData: 
	TnHOsOkOHgSvM+AtWQMNfAMbU6frvZucLbfu3EgzrjJbXhJsAy39699QRUw4kDOSVKbrTvUCFvhYLwM4tKgWvJR06JlRbx17rtMMl7CM9fJduLbCzBrQd0d54hmeOfaJqK0xxz+XXRU/Rtov3SR1uxcMEkUD4tVLIQXle9YHshutx9blyD+sjfgSkynhDStcrw09SCJbRmFMFEfwLuPnPUygP+HfRZlUksxlZgO6jGxFa6DWmRtuGhS66vOz5y58JhaK5vwgg1FSnxiWDnU4+nbF0qhQL1FjeqUa6mx/W1+mhBfwGvDeI23rOWuGQxbNBz2wq0l0puw/8Q4Ihw+CSwumqL7UqTDIHlbQWS4zmCc9Vt02ivtn86rMhyd4R9oh29CQxlCTD+aCsiEJJauDpvoSawDXhNxBM+oFduN0co5CBD8pUyeG12wRKyC7logFqC+sPi46m6za1qLdsllnlTIubfEht+jL483Qly85yWZcBA2M3HyKOdJQ0qaFrsnu2chwEvoIY+N6s22aw2xNvfUpqL0WeKvYqQXNlL7D522HFq8QDPLJJyoIzmxoyL1sN3kmUQn9Mf1D7WHufeTLVgNKr+bjSPciM6uO1uZpsrLIYuk/7uvLCXsmpheXBnNovEk6cKkx3jGhUP9JufkMpvG4aWUFqslMyB6GkpcDcVXNJ93dC28bvYwRxrvbf2E0fzf4sl/i892IuFk7yB7LNUXWf996J8A7wznw7H0jnEJBThbWvv072SG+tys4nnRxTqEi+6NvYmNxK1lJ3L8dANQlTUhuAIhus+BOU4l9mKM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff32996-b7d2-427a-feed-08d7e98205ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 01:34:55.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL6DRfkAs1YLJleazfSAm0rm1Y3CGpNErrqfkRnVby9rXITefcc4NDxJ8D4/Ttk+89fU84eRf49cG8wxYgxQVkF5nnqyU3heEJ1BI1XIANs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3054
Content-Type: multipart/alternative;
 boundary="------------4A5F88A9B099170B4073C4BC"
Content-Language: en-US

--------------4A5F88A9B099170B4073C4BC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/25/20 12:43 PM, Khem Raj wrote:
>
> On 4/24/20 5:40 AM, Richard Purdie wrote:
>> On Fri, 2020-04-24 at 09:09 +0800, Changqing Li wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> we have offcially dropped python2, so it is possible
>>> that our code run on python3 only host, so change
>>> shebang to python3 to avoid error like:
>>> python: command not found
>> I worry this is going to be the start of a huge pile or unstreamable
>> patches. We may have to provide "python" on target but that probably is
>> a policy decision we should discuss.
>>
> I think python as python3 is used by some distros, but it sets up for
> same py2->py3 problem when python4 comes out, so perhaps calling out
> version specific python is a good approach but I think such patches
> should be accepted upstream first. OE should not define its own policy
> without upstream python's decision to move forward.

Here is some info related to this:

https://www.python.org/dev/peps/pep-0394/

It says:

---
Distributors may choose to set the behavior of the python command as 
follows:

python2,
python3,
not provide python command,
allow python to be configurable by an end user or a system administrator.
---


And fedora31 use python as python3,  which realized by install 
python-unversioned-command 
<https://apps.fedoraproject.org/packages/python-unversioned-command>

refer:https://fedoraproject.org/wiki/Changes/Python_means_Python3

but fedora31 image on docker hub don't install 
python-unversioned-command,  so there is no python.
<https://apps.fedoraproject.org/packages/python-unversioned-command>


packages like  python3-pip,   they officially said,  they will drop 
python from 21.0, and now we have 20.0.2,

so for upstream,  they support both python2 and python3,  in this 
condition,  maybe upstream will not

accept change shebang from python to python3.  but I will report this to 
upstream to see what's their opinion.

>
>> Cheers,
>>
>> Richard
>>
>>
>> 
>>

--------------4A5F88A9B099170B4073C4BC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/25/20 12:43 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:fe0fde34-92fc-72b6-30f8-6f4c0d801cd9@gmail.com">
      <pre class="moz-quote-pre" wrap="">

On 4/24/20 5:40 AM, Richard Purdie wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, 2020-04-24 at 09:09 &#43;0800, Changqing Li wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

we have offcially dropped python2, so it is possible
that our code run on python3 only host, so change
shebang to python3 to avoid error like:
python: command not found
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I worry this is going to be the start of a huge pile or unstreamable
patches. We may have to provide &quot;python&quot; on target but that probably is
a policy decision we should discuss.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think python as python3 is used by some distros, but it sets up for
same py2-&gt;py3 problem when python4 comes out, so perhaps calling out
version specific python is a good approach but I think such patches
should be accepted upstream first. OE should not define its own policy
without upstream python's decision to move forward.</pre>
    </blockquote>
    <p>Here is some info related to this:</p>
    <p><a href="https://www.python.org/dev/peps/pep-0394/">https://www.python.org/dev/peps/pep-0394/</a></p>
    <p>It says:<br>
    </p>
    <p>---
      <br>
      Distributors may choose to set the behavior of the python command
      as follows:
      <br>
      <br>
      python2,
      <br>
      python3,
      <br>
      not provide python command,
      <br>
      allow python to be configurable by an end user or a system
      administrator.
      <br>
      --- <br>
    </p>
    <p><br>
    </p>
    <p>And fedora31 use python as python3,&nbsp; which realized by install <a class="external text" href="https://apps.fedoraproject.org/packages/python-unversioned-command" style="box-sizing: inherit; text-decoration: none; color:
        rgb(102, 51, 102); background-image:
        linear-gradient(transparent, transparent),
        url(&quot;data:image/svg&#43;xml,%3Csvg
        xmlns:rdf=%22http://www.w3.org/1999/02/22-rdf-syntax-ns%23%22
        xmlns=%22http://www.w3.org/2000/svg%22 height=%2213%22
        width=%2213%22 version=%221.1%22
        xmlns:cc=%22http://creativecommons.org/ns%23%22
        xmlns:dc=%22http://purl.org/dc/elements/1.1/%22%3E %3Cg
        transform=%22translate%28-36.467808%2C-258.39005%29%22%3E
        %3Cpath style=%22opacity:1%3Bfill:%233366bb%3B%22
d=%22m41.47%2C259.4%2C7%2C0%2C0%2C7-2-2-3%2C2%2C0-1%2C3-2.25%2C1%2C1%2C0-3.75-3.75%2C0%2C1%2C1-2.25%2C3-1%2C0%2C2-3z%22/%3E
        %3Cpath style=%22opacity:1%3Bfill:%233366bb%3B%22
d=%22m43.47%2C261.4-5%2C0%2C0%2C8%2C8%2C0%2C0-5-1%2C0%2C0%2C4-6%2C0%2C0-6%2C4%2C0z%22/%3E
        %3Cpath style=%22opacity:1%3Bfill:%2315a5ea%3B%22
d=%22m40.55%2C263.9c0-0.6213%2C0.6213-0.6213%2C0.6213-0.6213%2C1.864%2C0.6213%2C3.107%2C1.864%2C3.728%2C3.728%2C0%2C0%2C0%2C0.6213-0.6213%2C0.6213-1.243-1.864-1.864-2.485-3.728-3.728z%22/%3E
        %3C/g%3E %3C/svg%3E&quot;); background-position: right center;
        background-size: initial !important; background-repeat:
        no-repeat; background-attachment: initial !important;
        background-origin: initial !important; background-clip: initial
        !important; background-color: rgb(247, 247, 249); touch-action:
        manipulation; padding-top: 0px !important; padding-right: 13px;
        padding-bottom: 0px !important; padding-left: 0px !important;
        font-family: Hack, monospace; font-size: 12.6px; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px;">python-unversioned-command</a></p>
    <p>refer:<a href="https://fedoraproject.org/wiki/Changes/Python_means_Python3">https://fedoraproject.org/wiki/Changes/Python_means_Python3</a>
      <br>
    </p>
    <p>but fedora31 image on docker hub don't install <a class="external text" href="https://apps.fedoraproject.org/packages/python-unversioned-command" style="box-sizing: inherit; text-decoration: none; color:
        rgb(102, 51, 102); background-image:
        linear-gradient(transparent, transparent),
        url(&quot;data:image/svg&#43;xml,%3Csvg
        xmlns:rdf=%22http://www.w3.org/1999/02/22-rdf-syntax-ns%23%22
        xmlns=%22http://www.w3.org/2000/svg%22 height=%2213%22
        width=%2213%22 version=%221.1%22
        xmlns:cc=%22http://creativecommons.org/ns%23%22
        xmlns:dc=%22http://purl.org/dc/elements/1.1/%22%3E %3Cg
        transform=%22translate%28-36.467808%2C-258.39005%29%22%3E
        %3Cpath style=%22opacity:1%3Bfill:%233366bb%3B%22
d=%22m41.47%2C259.4%2C7%2C0%2C0%2C7-2-2-3%2C2%2C0-1%2C3-2.25%2C1%2C1%2C0-3.75-3.75%2C0%2C1%2C1-2.25%2C3-1%2C0%2C2-3z%22/%3E
        %3Cpath style=%22opacity:1%3Bfill:%233366bb%3B%22
d=%22m43.47%2C261.4-5%2C0%2C0%2C8%2C8%2C0%2C0-5-1%2C0%2C0%2C4-6%2C0%2C0-6%2C4%2C0z%22/%3E
        %3Cpath style=%22opacity:1%3Bfill:%2315a5ea%3B%22
d=%22m40.55%2C263.9c0-0.6213%2C0.6213-0.6213%2C0.6213-0.6213%2C1.864%2C0.6213%2C3.107%2C1.864%2C3.728%2C3.728%2C0%2C0%2C0%2C0.6213-0.6213%2C0.6213-1.243-1.864-1.864-2.485-3.728-3.728z%22/%3E
        %3C/g%3E %3C/svg%3E&quot;); background-position: right center;
        background-size: initial !important; background-repeat:
        no-repeat; background-attachment: initial !important;
        background-origin: initial !important; background-clip: initial
        !important; background-color: rgb(247, 247, 249); touch-action:
        manipulation; padding-top: 0px !important; padding-right: 13px;
        padding-bottom: 0px !important; padding-left: 0px !important;
        font-family: Hack, monospace; font-size: 12.6px; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px;">python-unversioned-command,&nbsp; so
        there is no python.<br>
      </a></p>
    <p><br>
    </p>
    <p>packages like&nbsp; python3-pip,&nbsp;&nbsp; they officially said,&nbsp; they will
      drop python from 21.0, and now we have 20.0.2,</p>
    <p>so for upstream,&nbsp; they support both python2 and python3,&nbsp; in this
      condition,&nbsp; maybe upstream will not <br>
    </p>
    <p>accept change shebang from python to python3.&nbsp; but I will report
      this to upstream to see what's their opinion.</p>
    <blockquote type="cite" cite="mid:fe0fde34-92fc-72b6-30f8-6f4c0d801cd9@gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Cheers,

Richard




</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4A5F88A9B099170B4073C4BC--
