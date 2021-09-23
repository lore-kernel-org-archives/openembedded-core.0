Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4971.1632405734046931832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 07:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=aQpZ3ipL;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4900a564d0=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NCBveL023579
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=UFK37hbk67nGo/AqEj9na33PB176xokKmQgC9NGUHmA=;
 b=aQpZ3ipLvy/Sa+WdD+coCfQO81xAzUe0vo1Taf1EiOlxGCb3rPP63W1fIL5VhjWnlU4H
 RVwbbgKcF0vOXE9FXEjWu7K8Q6RboRtPftgPdZipLH0t1DEcgQn8KM414QfLFyVMbva+
 BwK0/eYQ94UfRvX7vGrCtWr9dobBnDHPm7N0lK3EAQE7BTgY+h1L2u/lXVmZPyUidkPu
 hOwk2RwPKSIe4pZaN6ahujVIkVJjk+1Au9OOI/Doway2jJ34k0OiqrEXvaQtUZ5SaRf8
 nZalbGorNRu2LYy5rLxZ+AnMevJMyBYVoq5IeZpk1L1RKUn/uUsaMjiJqbNLygwxBGRC DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8gcf8d5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:02:11 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NDw7KP014650
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:02:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b8gcf8d5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Sep 2021 14:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcitZ1c29W0SLjf9sRhQfsw20ciGm/TlCoEWurqay0578Y+gkcSGgDvzhno3jQE7xS3VtsCAPNa9KEyblyxR5xj/P1yLRaioSYO/OHgPvHSco1Qfj97m3F13udLRlG0QKAAYavQSl71BnqCzmt4oaAhIvDJn5487f1+jgtNKRtgIcTRv2VQMbljiVY9+UC/YPdM14saHt0cCFlNxOrcp2oQIaT79Gm2BPLzxnv3BXgPMBg6P3GGqNz1GxZEs63UvB2qxeUc4oChSUJmor2mQC+HYDj54AOaalzzdb2nAWIPa+EK0p/6shmvbHm12lviE6xdPfJ8j3KusPnbmaWKgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UFK37hbk67nGo/AqEj9na33PB176xokKmQgC9NGUHmA=;
 b=AqcqCkxQvGB2Fdf8SOP23XTqE9p6JYn8Yde7fEGUenKqI1zmmQmd9mUlZWos5J0YtzKB0xWzsQML6RTXOfaNCh5X/0+mRMmfLRU1ejamnO+q7COBagjjsZ7bXQ1Q4H/XcWIdf9PrRQHTNf3TfLduPYQj8mD84udGtrCqL79ZBmS/M8ool8T9wcILUTRZ8gcaCAaUMVKYK/loV61lZadeaKM1MY6NaBeEFaHFexiBAAjQfIOS34Mi92UrrkrYr1JhYya3QdVF/Lox7iVPgUggYguQnq2VS3zLICcaF+B1AIsPwCe2cWXjPHz6e6J793k05ScpxPSVI6g3K1E+vFqIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 14:02:07 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::e5b7:1e6c:e33e:3b52%2]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 14:02:07 +0000
Subject: Re: [OE-core] [PATCH] create-spdx: Don't collect natives sources
To: Joshua Watt <jpewhacker@gmail.com>,
        Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
        OE-core <openembedded-core@lists.openembedded.org>
References: <20210922221420.4115636-1-saul.wold@windriver.com>
 <AM9PR09MB4642D180F4CE760601B2A4D4A8A39@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <1d6ac5dd187543559fc07e12be5f9536@axis.com>
 <CAJdd5GY3MiDVw+u-YgOXGviYSNbf_vnr3KivR8qu6MAygfv6Tw@mail.gmail.com>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <55c89b18-8d0f-7aa5-4d26-ee5910d3b53f@windriver.com>
Date: Thu, 23 Sep 2021 07:02:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAJdd5GY3MiDVw+u-YgOXGviYSNbf_vnr3KivR8qu6MAygfv6Tw@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
Received: from [10.23.90.211] (71.238.119.71) by MW4PR03CA0052.namprd03.prod.outlook.com (2603:10b6:303:8e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 14:02:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a757d7b6-caab-4472-de1d-08d97e9aba80
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2808CC230FC1341E917C0C13EEA39@BYAPR11MB2808.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	++qgEgluKn9Tqq+F2SYPZhQT9aGyvlzWl5npsOkx08PmfeA3J80iQEHoUdnDiJwJpTL/cgmByE/XEh8UMa+aGS5ssfyyxIhcVNiQjuiTRG9U1tr9MiIsIm/zluFRqq8oxw+kv7wAcZ0B0mb5DmX8bKktr384FsazGQwZniub8BRzbuEj8xHJtwrTDtp/cCTpqADvvQr1SkQ1rC6yRxmvxA6R58XYLFuN4lM3mfwNvZag2vlr6DLCPPLnnWRhO4DzxoULSr7kPRNx14sFNHesWQxNmHjiB5wEsheGAh8CjO05LQzJQka65Jqpo1uN5WnPDYoq8q8sWFrkBItzu9EUNx8a201JwNuysJfO8lYbYY2xRWM9q1BaHBrGzYcjxqGtK1MMEPiONypDoGXlWtAq4jmGn4kWH+CW1pZp++xvHrOo4Rq5AxASUroMOE/1aOSope/++tGbgJWonJNkI6DmhG9UPciQm0RlpbMQFJxEAgau6LBWM+9MQYxn3CzSVxGw7SsAuWA5gFhYYuoXH23MJguM8NqiCfwpdxPZDApbkG7CUdPAHlNp04SSgSxpZLeiQFtRDWs22g+PR/tzcejN8KonSGO0IXvDik4dhWBSqZm7uc3aeuIStu1oC90N3sRmOIbKNifAH2o+jutk71irI9qevfYzwJZO5TF/dYMs4lKVAUmctm84Dunaz0edHMPeLmqKEo0p560roYvdxidROex30ruuQJydXURH6rYAMYl/nh5nX5rA4xp7h8USR+UTd4HHFaR8ym50vdZbCjkCEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(36756003)(53546011)(16576012)(31696002)(66476007)(2616005)(110136005)(66556008)(86362001)(26005)(2906002)(6486002)(38350700002)(8936002)(8676002)(5660300002)(956004)(316002)(38100700002)(83380400001)(54906003)(508600001)(66946007)(52116002)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnYwRUFRS3lRTTByVG9VOTVPS0hIL3cxQlVIVi9qZ2hCbGpTczNuWTdVelg1?=
 =?utf-8?B?OHplNVJ1clRtTmRYa0c2KzJydWxZMUdYbjlXMCtJZ3FBWllkQ0dBNzU1cVBS?=
 =?utf-8?B?U2lBanE0dGNDN01PMUhlbG50c056NGFWN0Rrak85dXNQZGQ2K2VuU3hLMzRV?=
 =?utf-8?B?eForYzBLSkovWksxTGJDZWJnNjRxU1FMaXFZUk5jRkN2YmlUQXFSUHNvbjhh?=
 =?utf-8?B?VXRxdTRqOGNkRStmTEg2djB0VkNxRFpZMkZoSGZKaHNKVVVDQ1dJVDNpRUl6?=
 =?utf-8?B?SzdWQnVNakhHMVZ5ZkY5ZlJzd1FDeXZ2N1U0MXNEQllLUHl0dFFIMmZBWXk1?=
 =?utf-8?B?bkVWTzhrT2Q5aTZUOEt4dFRMUXB2aVN0akl3Q0l4ZFBSaFVSc0RvR2I3SnRh?=
 =?utf-8?B?SHpHU0ZQMXFyNW1uWlU2QXRod2t4aFJrYWNjaS9MdzVoUEtPN2ZJOUxoWVds?=
 =?utf-8?B?dTgrRHlta3V6WkExUDJkVngvNFRpUk1wK0M1S0l0V2xvRm1icFJmT3czMEZh?=
 =?utf-8?B?Vm9qMkZtVmV4bEYySW9OMWtXOERNNEJDMERJcEFyZ0V6R3p2djNlTzhlY21m?=
 =?utf-8?B?dFdQTmJlMmlQSS85cnZ2eXFKVXhzM0dZYTc1MWxFajFNVW82NEU5UiszelFT?=
 =?utf-8?B?ZDBkZXB5bEhORi9keGc0OWEwcVA1ZUhlNktHcDZtTlNKK2dtMkVVNXk0SUZ0?=
 =?utf-8?B?amFuelhmdjdTdlZobGRoRVBpL2tlcjJJOUN6TlFraWQ0bDJodjJKNmIxeks1?=
 =?utf-8?B?OFhReWkwOU9nM1E1S0FkaDBSQXRCWVVXaVZpc0lPNG5BcTNkclRlcFhRdVNG?=
 =?utf-8?B?NGExQ3ZsR1I1N0Rra3hITXI0NW0zblp0VEYrbTZKb1B6MmlKSFlybSsyd3dt?=
 =?utf-8?B?b0hVOWVwa2dDdGVqQmY5SVdFdFdYcDNGbzdrZU9JQ21renJ6OEQwMHltTEM1?=
 =?utf-8?B?R0FNVW1qb1dsb0JGV1F5OERTTDZxcDhDNGFNNldhampaeVlad3pSaEppM2ty?=
 =?utf-8?B?SnlBYzVGWnJMVi9sbUkzVVdmaDRHS05jWG5VMmNGM0pJMHZrMlJPbXhkb3FJ?=
 =?utf-8?B?ejVLcEtubEhFVGk3ZktvR2k5VERFd1hGN3lKV2tRbnY2a3BCalhDTEpZd0NF?=
 =?utf-8?B?NE9aTXlEZ0U0N1A2ZWJzcGZHQmpQTXR6TEdnaTd1Z0dBcTl6QzJISlhwUFdI?=
 =?utf-8?B?enNJR3J4Tzc4RzRXRU4zRHE1SlE2anRlYk8zWm9RVEp4RnBJU3VSVTIyL3N5?=
 =?utf-8?B?ME1hNXV2T2VvR2luZmxWVU1CZ0FscVlKZy9JcHRybStUMElOc3VCR2pMVGhU?=
 =?utf-8?B?c0tzOUZROGRYVjdrZHFXMWpzTVJhVmprVjNCL2FYZ2ZSOEFPOUpRQkduQy8z?=
 =?utf-8?B?eUVBOW9xb1RkN0Rkbmt1d2lUMW9vYlVQckxFNmpCVy8vOWFYNU9yRy90Uk9Y?=
 =?utf-8?B?Q0MxaFRlWjF1aTRkbGsyS0ZQOTFJbGU1d0N0ZkNneGV5Y3JrbHUxanhoNDBL?=
 =?utf-8?B?UDk1Z1NHL0ZrWWVKVXJVVW4vVUwxaG1OekxaZHRCM3NZTjlzU2V5RWJycU5r?=
 =?utf-8?B?VFYyVytWeW9uZTZWQ0ZaUkZpSk9hRmdMYUNxVEdjUURKSE53MDNHbmczZTdm?=
 =?utf-8?B?R2QyNEtkZlNtdUcrY05FankzNXlrWXBvSEp3bVhPdThHZ01FUVJLaUpPOG0r?=
 =?utf-8?B?ZFAvNGQrZ29WUENIdVRRWUVWeHhKTllnSGkvbGxURmJaTWNNaEdjbWRuV0Jz?=
 =?utf-8?Q?nD/qlVO5OGxc7JgZREx9bAY3d9h693HOI79i03T?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a757d7b6-caab-4472-de1d-08d97e9aba80
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:02:07.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lg/JZEwP3/7n1PqLifr3YKU9BBrW37Qh/YGBtGFCyIXRXeNSgDSHDBruV9eAUnyW24ntH2aGIFL1Vz7tyrtJ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2808
X-Proofpoint-ORIG-GUID: 8oLqiCMu_Dv5yOyy8XIZzSWtCz85VIdQ
X-Proofpoint-GUID: 20uVrg0ro9o-gNAdUPx5oRTm0tTIa4oU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230089
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 18NCBveL023579
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/23/21 5:16 AM, Joshua Watt wrote:
>=20
>=20
> On Thu, Sep 23, 2021, 5:27 AM Peter Kjellerstedt=20
> <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>> wrot=
e:
>=20
>      > -----Original Message-----
>      > From: openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org> <openembedded-
>      > core@lists.openembedded.org <mailto:core@lists.openembedded.org>=
>
>     On Behalf Of Konrad Weihmann
>      > Sent: den 23 september 2021 10:24
>      > To: Saul Wold <Saul.Wold@windriver.com
>     <mailto:Saul.Wold@windriver.com>>; openembedded-
>      > core@lists.openembedded.org <mailto:core@lists.openembedded.org>=
;
>     JPEWhacker@gmail.com <mailto:JPEWhacker@gmail.com>
>      > Subject: Re: [OE-core] [PATCH] create-spdx: Don't collect native=
s
>     sources
>      >
>      >
>      >
>      > On 23.09.21 00:14, Saul Wold wrote:
>      > > When the collect_dep_sources() runs, it collects sources from =
both
>      > native
>      > > and non-native recipes. Later when the GENERATED_FROM matching
>     occurs it
>      > > may find the file (via checksum) from the native recipe since
>     it's the
>      > > same checksum as the target file. The that are generated
>     DocumentRefs
>      > > point to the native recipe rather than the target recipe
>     DocumentRef.
>      > >
>      > > Signed-off-by: Saul Wold <saul.wold@windriver.com
>     <mailto:saul.wold@windriver.com>>
>      > > ---
>      > >=C2=A0 =C2=A0meta/classes/create-spdx.bbclass | 4 ++++
>      > >=C2=A0 =C2=A01 file changed, 4 insertions(+)
>      > >
>      > > diff --git a/meta/classes/create-spdx.bbclass
>     b/meta/classes/create-
>      > spdx.bbclass
>      > > index 3c73c21c04..8f7fae43f1 100644
>      > > --- a/meta/classes/create-spdx.bbclass
>      > > +++ b/meta/classes/create-spdx.bbclass
>      > > @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
>      > >
>      > >=C2=A0 =C2=A0 =C2=A0 =C2=A0sources =3D {}
>      > >=C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in dep_recipes:
>      > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Don't collect sources from nati=
ve recipes as they
>      > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # match non-native sources also.
>      > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if "-native" in dep.recipe.name
>     <https://urldefense.com/v3/__http://dep.recipe.name__;!!AjveYdw8EvQ=
!KhzFBhUyb3qZAcSIhlUVGRaWHWWBWh2YZu-s_7VeaS3HaafxJOuneeo9xWwBCOboCok$>:
>      >
>      > That looks a bit too fuzzy to me - I would have expected
>      >
>      > if dep.recipe.name.endswith("-native"):
>      >
>      > here. Otherwise this is very prone to false positives
>=20
>     Absolutely. E.g., we have a recipe called crate-native-tls for
>     the native-tls Rust crate.
>=20
>     At the same time I hate all these hardcoded tests for recipe types
>     all over OE Core as they assume only the types that are in OE Core
>     exist without any (easy) way of extending the tests for non-OE Core
>     recipe types.
>=20
>     Would it instead be possible to add the is_native in do_create_spdx=
()
>     to the recipe object so that it is available here?
>=20
>=20
> Yes. We should be able to add a custom annotation when we create the=20
> recipe that we can check later
>=20
I will re-work the patch and work on adding the is_native to the Recipe=20
object.

Sau!

>=20
>      > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
>      > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe_files =3D set(d=
ep.recipe.hasFiles)
>      > >
>      > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for spdx_file in dep.d=
oc.files:
>=20
>     //Peter
>=20

--=20
Sau!
